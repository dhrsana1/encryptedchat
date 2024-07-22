import 'package:cryptography/cryptography.dart';

Future<void> main() async {
  // In this example, we use ECDSA-P256-SHA256
  final algorithm = Ecdsa.p521(Sha256());

  // Generate a random key pair
  final secretKey = await algorithm.newSecretKey();
  final publicKey = await algorithm.publicKey(secretKey);

  // Sign a message
  final message = <int>[1,2,3];
  final signature = await algorithm.sign(
    [1,2,3],
    secretKey: secretKey,
  );

  // Anyone can verify the signature
  final isVerified = await algorithm.verify(
    message: message,
    signature: signature,
  );
}