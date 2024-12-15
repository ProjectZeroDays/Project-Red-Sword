# Use a slim Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Create a non-root user and switch to it
RUN useradd -m appuser
USER appuser

# Copy project files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Gradio default port
EXPOSE 7860

# Set environment variables for API keys
ENV OPENAI_API_KEY=your-openai-api-key
ENV HUGGINGFACE_API_KEY=your-huggingface-api-key

# Command to start the Gradio app
CMD ["python", "src/frontend/archive_gui.py"]
