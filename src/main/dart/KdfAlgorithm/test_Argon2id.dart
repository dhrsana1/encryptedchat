import 'package:cryptography/cryptography.dart';

Future<void> main() async {
  final algorithm = Argon2id(
    parallelism: 3,
    memorySize: 10000000,
    iterations: 3,
    hashLength: 32,
  );

  final newSecretKey = await algorithm.deriveKey(
    secretKey: SecretKey([1,2,3]),
    nonce: [4,5,6],
  );
  final newSecretKeyBytes = await newSecretKey.extractBytes();

  print('hashed password: $newSecretKeyBytes');
}