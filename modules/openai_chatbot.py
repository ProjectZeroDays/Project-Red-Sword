from openai import OpenAI
import gradio as gr

api_key = "sk-..."  # Replace with your key
client = OpenAI(api_key=api_key)

def predict(message, history):
    history_openai_format = []
    for msg in history:
        history_openai_format.append(msg)
    history_openai_format.append(message)
  
    response = client.chat.completions.create(model='gpt-3.5-turbo',
    messages= history_openai_format,
    temperature=1.0,
    stream=True)

    partial_message = ""
    for chunk in response:
        if chunk.choices[0].delta.content is not None:
              partial_message = partial_message + chunk.choices[0].delta.content
              yield partial_message

gr.ChatInterface(predict, type="messages").launch()
