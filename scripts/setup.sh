#!/bin/bash

echo "Setting up the Cybersecurity Framework..."

# Install Python dependencies
if [ -f "requirements.txt" ]; then
    echo "Installing Python dependencies..."
    pip install -r requirements.txt || {
        echo "Dependency installation failed. Please check your Python environment."
        exit 1
    }
else
    echo "requirements.txt not found!"
    exit 1
fi

# Ask the user for deployment options
echo "Select your deployment option:"
echo "1. Local Docker Setup"
echo "2. Deploy to AWS (via Docker)"
echo "3. Deploy to Azure (via Docker)"
echo "4. Deploy to Hugging Face Spaces"
echo "5. Deploy to DigitalOcean (via Docker)"
echo "6. Deploy to Google Cloud (via Docker)"
read -p "Enter the option number: " deploy_option

case $deploy_option in
    1)
        echo "Building and running the Docker container locally..."
        docker build -t archive-analyzer .
        docker run -p 7860:7860 archive-analyzer
        ;;
    2)
        echo "Building the Docker image for AWS..."
        docker build -t archive-analyzer .
        
        echo "Configuring AWS ECR..."
        aws ecr get-login-password --region YOUR_AWS_REGION | docker login --username AWS --password-stdin YOUR_AWS_ACCOUNT_ID.dkr.ecr.YOUR_AWS_REGION.amazonaws.com
        aws ecr create-repository --repository-name archive-analyzer || echo "Repository already exists."
        docker tag archive-analyzer:latest YOUR_AWS_ACCOUNT_ID.dkr.ecr.YOUR_AWS_REGION.amazonaws.com/archive-analyzer
        docker push YOUR_AWS_ACCOUNT_ID.dkr.ecr.YOUR_AWS_REGION.amazonaws.com/archive-analyzer
        
        echo "Deploying to AWS Elastic Beanstalk..."
        eb init -p docker archive-analyzer --region YOUR_AWS_REGION
        eb create archive-analyzer-env
        ;;
    3)
        echo "Building the Docker image for Azure..."
        docker build -t archive-analyzer .
        
        echo "Configuring Azure ACR..."
        az acr login --name YOUR_AZURE_ACR_NAME
        az acr create --resource-group YOUR_RESOURCE_GROUP --name YOUR_AZURE_ACR_NAME --sku Basic || echo "Registry already exists."
        docker tag archive-analyzer:latest YOUR_AZURE_ACR_NAME.azurecr.io/archive-analyzer
        docker push YOUR_AZURE_ACR_NAME.azurecr.io/archive-analyzer
        
        echo "Deploying to Azure App Service..."
        az webapp create --resource-group YOUR_RESOURCE_GROUP --plan YOUR_APP_SERVICE_PLAN --name YOUR_APP_NAME --deployment-container-image-name YOUR_AZURE_ACR_NAME.azurecr.io/archive-analyzer:latest
        ;;
    4)
        echo "Deploying to Hugging Face Spaces..."
        git init
        git remote add origin https://huggingface.co/YOUR_USERNAME/YOUR_PROJECT_NAME
        git add .
        git commit -m "Initial commit for Hugging Face Spaces"
        git push -u origin main
        echo "Hugging Face deployment completed. Visit your Hugging Face Spaces page to view the app."
        ;;
    5)
        echo "Building the Docker image for DigitalOcean..."
        docker build -t archive-analyzer .
        
        echo "Deploying to DigitalOcean..."
        doctl auth init
        doctl apps create --spec digitalocean-app.yaml
        ;;
    6)
        echo "Building the Docker image for Google Cloud..."
        docker build -t archive-analyzer .
        
        echo "Configuring Google Cloud..."
        gcloud auth configure-docker
        docker tag archive-analyzer gcr.io/YOUR_PROJECT_ID/archive-analyzer
        docker push gcr.io/YOUR_PROJECT_ID/archive-analyzer
        
        echo "Deploying to GKE..."
        kubectl apply -f google-k8s.yaml
        ;;
    *)
        echo "Invalid option. Exiting setup."
        exit 1
        ;;
esac

echo "Setup completed successfully!"
