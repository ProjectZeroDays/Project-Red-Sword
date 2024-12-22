
#!/bin/bash

echo "Starting Deployment Testing..."

# Test Docker Deployment
echo "Building Docker Image..."
docker build -t cybersecurity/framework .
if [ $? -eq 0 ]; then
    echo "Docker Image Built Successfully."
else
    echo "Docker Build Failed!" && exit 1
fi

echo "Running Docker Container..."
docker run -d -p 5000:5000 --name test_cybersecurity_framework cybersecurity/framework
if [ $? -eq 0 ]; then
    echo "Docker Container Running Successfully."
else
    echo "Docker Run Failed!" && exit 1
fi

echo "Checking Docker Logs..."
docker logs test_cybersecurity_framework

# Test Kubernetes Deployment
echo "Applying Kubernetes Deployment..."
kubectl apply -f infra/k8s_deployment.yaml
if [ $? -eq 0 ]; then
    echo "Kubernetes Deployment Applied Successfully."
else
    echo "Kubernetes Deployment Failed!" && exit 1
fi

echo "Checking Kubernetes Pods..."
kubectl get pods

echo "Deployment Testing Completed."
