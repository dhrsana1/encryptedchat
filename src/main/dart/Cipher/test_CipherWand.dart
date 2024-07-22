import 'package:cryptography/cryptography.dart';

Future<void> main() async {
  final cipher = Chacha20.poly1305Aead();
  final secretKey = await cipher.newSecretKey();
  final wand = await cipher.newCipherWandFromSecretKey(secretKey);

  // Encrypt
  final secretBox = await wand.encrypt([1,2,3]);

  print('Nonce: ${secretBox.nonce}');
  print('Cipher text: ${secretBox.cipherText}');
  print('MAC: ${secretBox.mac.bytes}');

  // Decrypt
  final clearText = await wand.decrypt(secretBox);
  print('Clear text: $clearText');
}