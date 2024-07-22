import 'package:cryptography/cryptography.dart';

Future<void> main() async {
  final algorithm = RsaSsaPkcs1v15(Sha256());

  // Generate a key pair
  final keyPair = await algorithm.newKeyPair();

  // Sign a message
  final message = <int>[1,2,3];
  final signature = await algorithm.sign(
    message,
    keyPair: keyPair,
  );
  print('Signature bytes: ${signature.bytes}');
  print('Public key: ${signature.publicKey.bytes}');

  // Anyone can verify the signature
  final isSignatureCorrect = await algorithm.verify(
    message,
    signature: signature,
  );
}