import os
import pytest
from app import process_inputs

def test_api_key_handling():
    openai_api_key = os.getenv("OPENAI_API_KEY")
    huggingface_api_key = os.getenv("HUGGINGFACE_API_KEY")
    
    assert openai_api_key is not None, "OPENAI_API_KEY is not set"
    assert huggingface_api_key is not None, "HUGGINGFACE_API_KEY is not set"

@pytest.mark.asyncio
async def test_input_validation():
    valid_image_url = "https://example.com/valid_image.jpg"
    invalid_image_url = "invalid_url"
    class_names = "cat, dog"
    
    # Test with valid inputs
    async for result in process_inputs(class_names, valid_image_url):
        assert "results" in result or "Fetching image and running model" in result
    
    # Test with invalid image URL
    async for result in process_inputs(class_names, invalid_image_url):
        assert "Invalid URL provided" in result
    
    # Test with empty class names
    async for result in process_inputs("", valid_image_url):
        assert "Provide class names" in result
