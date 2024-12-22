
# API Reference

## Secure API Endpoint
**Endpoint**: `/secure-endpoint`  
**Method**: `POST`  
**Description**: Validates user-provided commands and executes them securely.

### Request Body
```json
{
  "api_key": "string",
  "command": "string"
}
```

### Response
- **Success**:
```json
{
  "status": "success",
  "output": "Command 'example' executed securely"
}
```
- **Failure**:
```json
{
  "status": "failure",
  "error": "Unauthorized"
}
```

### Example
```bash
curl -X POST -H "Content-Type: application/json" -d '{"api_key": "your_key", "command": "ls"}' http://localhost:5000/secure-endpoint
```
