apiVersion: apps/v1
kind: Deployment
metadata:
  name: archive-analyzer
spec:
  replicas: 2
  selector:
    matchLabels:
      app: archive-analyzer
  template:
    metadata:
      labels:
        app: archive-analyzer
    spec:
      containers:
      - name: archive-analyzer
        image: YOUR_AZURE_ACR_NAME.azurecr.io/archive-analyzer:latest
        ports:
        - containerPort: 7860
        resources:
          limits:
            memory: "512Mi"
            cpu: "500m"
        env:
        - name: OPENAI_API_KEY
          valueFrom:
            secretKeyRef:
              name: openai-api-key
              key: api-key
        - name: HUGGINGFACE_API_KEY
          valueFrom:
            secretKeyRef:
              name: huggingface-api-key
              key: api-key
        - name: ANOTHER_API_KEY
          valueFrom:
            secretKeyRef:
              name: another-api-key
              key: api-key
