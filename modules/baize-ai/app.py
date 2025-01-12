import os
import logging
import sys
import gradio as gr
import torch
import gc
from app_modules.utils import *
from app_modules.presets import *
from app_modules.overwrites import *

logging.basicConfig(
    level=logging.DEBUG,
    format="%(asctime)s [%(levelname)s] [%(filename)s:%(lineno)d] %(message)s",
)

base_model = "project-baize/baize-v2-7b"
adapter_model = None
tokenizer, model, device = load_tokenizer_and_model(base_model, adapter_model)

total_count = 0
def predict(text,
            chatbot,
            history,
            top_p,
            temperature,
            max_length_tokens,
            max_context_length_tokens,):
    if text=="":
        yield chatbot, history, "Empty context."
        return 
    try:
        model
    except:
        yield [[text,"No Model Found"]],[], "No Model Found"
        return

    inputs = generate_prompt_with_history(text, history, tokenizer, max_length=max_context_length_tokens)
    if inputs is None:
        yield chatbot, history, "Input too long."
        return 
    else:
        prompt, inputs = inputs
        begin_length = len(prompt)
    input_ids = inputs["input_ids"][:, -max_context_length_tokens:].to(device)
    torch.cuda.empty_cache()
    global total_count
    total_count += 1
    print(total_count)
    if total_count % 50 == 0 :
        os.system("nvidia-smi")
    with torch.no_grad():
        for x in greedy_search(input_ids, model, tokenizer, stop_words=["[|Human|]", "[|AI|]"], max_length=max_length_tokens, temperature=temperature, top_p=top_p):
            if is_stop_word_or_prefix(x, ["[|Human|]", "[|AI|]"]) is False:
                if "[|Human|]" in x:
                    x = x[:x.index("[|Human|]")].strip()
                if "[|AI|]" in x:
                    x = x[:x.index("[|AI|]")].strip() 
                x = x.strip()   
                a, b = [[y[0], convert_to_markdown(y[1])] for y in history] + [[text, convert_to_markdown(x)]], history + [[text, x]]
                yield a, b, "Generating..."
            if shared_state.interrupted:
                shared_state.recover()
                try:
                    yield a, b, "Stop: Success"
                    return
                except:
                    pass
    del input_ids
    gc.collect()
    torch.cuda.empty_cache()
    try:
        yield a, b, "Generate: Success"
    except:
        pass

def retry(
        text,
        chatbot,
        history,
        top_p,
        temperature,
        max_length_tokens,
        max_context_length_tokens,
        ):
    logging.info("Retry...")
    if len(history) == 0:
        yield chatbot, history, f"Empty context"
        return
    chatbot.pop()
    inputs = history.pop()[0]
    for x in predict(inputs, chatbot, history, top_p, temperature, max_length_tokens, max_context_length_tokens):
        yield x

gr.Chatbot.postprocess = postprocess

with open("assets/custom.css", "r", encoding="utf-8") as f:
    customCSS = f.read()

with gr.Blocks(css=customCSS, theme=small_and_beautiful_theme) as demo:
    history = gr.State([])
    user_question = gr.State("")
    with gr.Row():
        gr.HTML(title)
        status_display = gr.Markdown("Success", elem_id="status_display")
    gr.Markdown
