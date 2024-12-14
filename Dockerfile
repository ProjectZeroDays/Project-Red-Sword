
# Use a slim Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Gradio default port
EXPOSE 7860

# Command to start the Gradio app
CMD ["python", "src/frontend/archive_gui.py"]
