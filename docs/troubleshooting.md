
# Troubleshooting Guide

## Common Issues

### Missing Dependencies
Ensure all dependencies are installed:
```bash
pip install -r requirements.txt
```

### Deployment Failures
#### Docker
Check container logs for errors:
```bash
docker logs <container_id>
```

#### Kubernetes
Inspect pod logs for failures:
```bash
kubectl logs <pod_name>
```
