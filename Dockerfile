# Use the official Python image from Docker Hub
FROM python:3.9

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install the dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Gradio default port
EXPOSE 7860

# Set environment variables for API keys
ENV OPENAI_API_KEY=${OPENAI_API_KEY}
ENV HUGGINGFACE_API_KEY=${HUGGINGFACE_API_KEY}

# Define the command to run the application using Gunicorn
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:7860", "src.frontend.archive_gui:app"]
