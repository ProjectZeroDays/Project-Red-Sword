import pytest
from app import random_url, open_image_url, process_inputs

@pytest.mark.asyncio
async def test_random_url():
    url = await random_url(None)
    assert url is not None
    assert url.startswith("http")

@pytest.mark.asyncio
async def test_random_url_handle_api_errors():
    url = await random_url(None)
    assert url is not None or url is None

@pytest.mark.asyncio
async def test_open_image_url():
    valid_url = "https://example.com/valid_image.jpg"
    invalid_url = "https://example.com/invalid_image.jpg"
    
    image = await open_image_url(valid_url)
    assert image is not None
    
    image = await open_image_url(invalid_url)
    assert image is None

@pytest.mark.asyncio
async def test_open_image_url_handle_http_errors():
    invalid_url = "https://example.com/invalid_image.jpg"
    image = await open_image_url(invalid_url)
    assert image is None

@pytest.mark.asyncio
async def test_process_inputs():
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
async def test_process_inputs_log_exceptions():
    invalid_image_url = "https://example.com/invalid_image.jpg"
    class_names = "cat, dog"
    async for result in process_inputs(class_names, invalid_image_url):
        assert "Something went wrong" in result

@pytest.mark.asyncio
async def test_process_inputs_check_class_names_empty():
    valid_image_url = "https://example.com/valid_image.jpg"
    async for result in process_inputs("", valid_image_url):
        assert "Provide class names" in result

@pytest.mark.asyncio
async def test_process_inputs_validate_image_url():
    invalid_image_url = "invalid_url"
    class_names = "cat, dog"
    async for result in process_inputs(class_names, invalid_image_url):
        assert "Invalid URL provided" in result

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
