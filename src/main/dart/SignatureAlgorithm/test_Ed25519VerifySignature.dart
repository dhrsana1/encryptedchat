import 'package:cryptography/cryptography.dart';

Future<void> main() async {
  final signedMessage = 'Hello, world!';

  final ed25519 = Ed25519();
  final keyPair = await ed25519.newKeyPair();
  final signature = await ed25519.signString(
    signedMessage,
    keyPair: keyPair,
  );

  // ...

  final isRealSignature = await ed25519.verifyString(
    signedMessage,
    signature: signature,
  );

  print('Signature verification result: $isRealSignature');
}