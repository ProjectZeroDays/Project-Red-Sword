# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install -r requirements.txt PyQt5

# Expose application port
EXPOSE 5000

# Run the application
CMD ["python", "src/frontend/archive_gui.py"]
