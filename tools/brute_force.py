
import itertools
import string

def brute_force_password(target_hash, hash_function, max_length=6):
    charset = string.ascii_letters + string.digits
    for length in range(1, max_length + 1):
        for attempt in itertools.product(charset, repeat=length):
            password = ''.join(attempt)
            if hash_function(password) == target_hash:
                print(f"Password found: {password}")
                return password
    print("Password not found.")
    return None

if __name__ == "__main__":
    import hashlib
    target = hashlib.md5("secret".encode()).hexdigest()
    brute_force_password(target, lambda p: hashlib.md5(p.encode()).hexdigest())
