import 'package:cryptography/cryptography.dart';

Future<void> main() async {
  final x25519 = X25519();
  final aliceWand = await x25519.newKeyExchangeWand();
  final bobPublicKey = await (await x25519.newKeyPair()).extractPublicKey();
  final secretKey = await aliceWand.sharedSecretKey(
    remotePublicKey: bobPublicKey,
  );
}