import 'package:cryptography/cryptography.dart';

Future<void> main() async {
  final message = <int>[1,2,3];

  // AES-CBC with 128 bit keys and HMAC-SHA256 authentication.
  final algorithm = AesCbc.with128bits(
    macAlgorithm: Hmac.sha256(),
  );
  final secretKey = await algorithm.newSecretKey();
  final nonce = algorithm.newNonce();

  // Encrypt
  final secretBox = await algorithm.encrypt(
    message,
    secretKey: secretKey,
  );
  print('Nonce: ${secretBox.nonce}')
  print('Ciphertext: ${secretBox.cipherText}')
  print('MAC: ${secretBox.mac.bytes}')

  // Decrypt
  final clearText = await algorithm.decrypt(
    secretBox,
    secretKey: secretKey,
  );
  print('Cleartext: $clearText');
}