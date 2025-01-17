import os
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.x963kdf import X963KDF

sharedinfo = b"ANSI X9.63 Example"
xkdf = X963KDF(
    algorithm=hashes.SHA256(),
    length=32,
    sharedinfo=sharedinfo,
)
key = xkdf.derive(b"input key")
xkdf = X963KDF(
    algorithm=hashes.SHA256(),
    length=32,
    sharedinfo=sharedinfo,
)
xkdf.verify(b"input key", key)