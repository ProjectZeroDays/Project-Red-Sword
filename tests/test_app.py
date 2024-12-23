import pytest
from app import random_url, open_image_url, process_inputs

@pytest.mark.asyncio
async def test_random_url():
    url = await random_url(None)
    assert url is not None
    assert url.startswith("http")

@pytest.mark.asyncio
async def test_open_image_url():
    valid_url = "https://via.placeholder.com/150"
    invalid_url = "https://via.placeholder.com/invalid_image.jpg"
    
    image = await open_image_url(valid_url)
    assert image is not None
    
    image = await open_image_url(invalid_url)
    assert image is None

@pytest.mark.asyncio
async def test_process_inputs():
    valid_image_url = "https://via.placeholder.com/150"
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
    invalid_image_url = "https://via.placeholder.com/invalid_image.jpg"
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

@pytest.mark.asyncio
async def test_input_validation():
    valid_image_url = "https://via.placeholder.com/150"
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

def test_logging_configuration():
    import logging
    logger = logging.getLogger()
    assert logger.level == logging.ERROR, "Logging level is not set to ERROR"
    assert len(logger.handlers) > 0, "No logging handlers are configured"

def test_input_validation_for_class_names():
    valid_image_url = "https://via.placeholder.com/150"
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
