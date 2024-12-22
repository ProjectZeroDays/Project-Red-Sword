
from transformers import pipeline

def analyze_sentiment(text):
    sentiment_analyzer = pipeline("sentiment-analysis")
    result = sentiment_analyzer(text)
    return result

# Example Usage
analysis = analyze_sentiment("This is amazing!")
print(analysis)
