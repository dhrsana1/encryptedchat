import 'package:cryptography/cryptography.dart';

Future<void> main() async {
  // Generate a key pair for Alice
  final algorithm = X25519();
  final aliceKeyPair = await algorithm.newKeyPair();

  // Generate a key pair for Bob.
  //
  // In a real application, we will receive or know Bob's public key
  // somehow.
  final bobKeyPair = await algorithm.newKeyPair();
  final bobPublicKey = await bobKeyPair.extractPublicKey();

  // We can now calculate a shared secret.
  final sharedSecret = await algorithm.sharedSecretKey(
    keyPair: aliceKeyPair,
    remotePublicKey: bobPublicKey,
  );
  final sharedSecretBytes = await sharedSecret.extractBytes();
  print('Shared secret: $sharedSecretBytes');
}