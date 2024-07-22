import 'package:cryptography/cryptography.dart';

Future<void> main() async {
  final algorithm = Ecdh.p384();

  // We need the private key pair of Alice.
  final aliceKeyPair = await algorithm.newKeyPair();

  // We need only public key of Bob.
  final bobKeyPair = await algorithm.newKeyPair();
  final bobPublicKey = await bobKeyPair.extractPublicKey();

  // We can now calculate a 32-byte shared secret key.
  final sharedSecretKey = await algorithm.sharedSecretKey(
    keyPair: aliceKeyPair,
    remotePublicKey: bobPublicKey,
  );
}