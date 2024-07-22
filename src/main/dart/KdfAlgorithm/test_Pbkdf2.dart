import 'package:cryptography/cryptography.dart';

Future<void> main() async {
  final pbkdf2 = Pbkdf2(
    macAlgorithm: Hmac.sha256(),
    iterations: 10000, // 20k iterations
    bits: 256, // 256 bits = 32 bytes output
  );

  // Calculate a hash that can be stored in the database
  final newSecretKey = await pbkdf2.deriveKeyFromPassword(
    // Password given by the user.
    password: 'qwerty',

    // Nonce (also known as "salt") should be some random sequence of
    // bytes.
    //
    // You should have a different nonce for each user in the system
    // (which you store in the database along with the hash).
    // If you can't do that for some reason, choose a random value not
    // used by other applications.
    nonce: const [1,2,3],
  );

  final secretKeyBytes = await secretKey.extractBytes();
  print('Result: $secretKeyBytes');
}