import os
import pytest
from app import process_inputs, random_url, open_image_url

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

@pytest.mark.asyncio
async def test_error_handling():
    invalid_image_url = "https://example.com/invalid_image.jpg"
    class_names = "cat, dog"
    
    # Test error handling in random_url
    url = await random_url(None)
    assert url is not None
    
    # Test error handling in open_image_url
    image = await open_image_url(invalid_image_url)
    assert image is None
    
    # Test error handling in process_inputs
    async for result in process_inputs(class_names, invalid_image_url):
        assert "Something went wrong" in result

def test_logging_configuration():
    import logging
    logger = logging.getLogger()
    assert logger.level == logging.ERROR, "Logging level is not set to ERROR"
    assert len(logger.handlers) > 0, "No logging handlers are configured"

def test_input_validation_for_class_names():
    valid_image_url = "https://example.com/valid_image.jpg"
    invalid_class_names = ""
    
    # Test with empty class names
    async for result in process_inputs(invalid_class_names, valid_image_url):
        assert "Provide class names" in result

def test_input_validation_for_image_url():
    invalid_image_url = "invalid_url"
    class_names = "cat, dog"
    
    # Test with invalid image URL
    async for result in process_inputs(class_names, invalid_image_url):
        assert "Invalid URL provided" in result

def test_security_headers():
    from app import app
    with app.test_client() as client:
        response = client.get('/')
        assert 'Content-Security-Policy' in response.headers
        assert 'Strict-Transport-Security' in response.headers
        assert 'X-Content-Type-Options' in response.headers
        assert 'X-Frame-Options' in response.headers
        assert 'X-XSS-Protection' in response.headers

def test_rate_limiting():
    from app import app
    with app.test_client() as client:
        for _ in range(10):
            response = client.get('/login')
            assert response.status_code == 200
        response = client.get('/login')
        assert response.status_code == 429

def test_ssl_redirect():
    from app import app
    with app.test_client() as client:
        response = client.get('/', base_url='http://localhost')
        assert response.status_code == 302
        assert response.headers['Location'].startswith('https://')
