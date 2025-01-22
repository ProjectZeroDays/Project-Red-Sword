#!/bin/bash

# Authenticate with Huggingface
echo "Authenticating with Huggingface..."
HUGGINGFACE_API_KEY=${HUGGINGFACE_API_KEY}
if [ -z "$HUGGINGFACE_API_KEY" ]; then
  echo "Error: Missing Huggingface API key"
  exit 1
fi

# Upload model or dataset to Huggingface
echo "Uploading model or dataset to Huggingface..."
MODEL_PATH="path/to/your/model"
DATASET_PATH="path/to/your/dataset"
if [ -d "$MODEL_PATH" ]; then
  echo "Uploading model..."
  huggingface-cli upload $MODEL_PATH --api-key $HUGGINGFACE_API_KEY
elif [ -d "$DATASET_PATH" ]; then
  echo "Uploading dataset..."
  huggingface-cli upload $DATASET_PATH --api-key $HUGGINGFACE_API_KEY
else
  echo "Error: Model or dataset path not found"
  exit 1
fi

# Include necessary steps for deployment
echo "Deployment steps completed successfully."
