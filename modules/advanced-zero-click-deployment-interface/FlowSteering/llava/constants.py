CONTROLLER_HEART_BEAT_EXPIRATION = 30
WORKER_HEART_BEAT_INTERVAL = 15

LOGDIR = "."

try:
    assert CONTROLLER_HEART_BEAT_EXPIRATION > 0, "CONTROLLER_HEART_BEAT_EXPIRATION must be positive"
    assert WORKER_HEART_BEAT_INTERVAL > 0, "WORKER_HEART_BEAT_INTERVAL must be positive"
    assert isinstance(LOGDIR, str) and LOGDIR, "LOGDIR must be a non-empty string"
except AssertionError as e:
    raise ValueError(f"Configuration error: {e}")
