import 'package:cryptography/cryptography.dart';

void main() async {
  final algorithm = Hkdf(
    hmac: Hmac.sha256(),
    outputLength: 32,
  );
  final secretKey = SecretKey([1,2,3]);
  final nonce = [4,5,6];
  final output = await algorithm.deriveKey(
    secretKey: secretKey,
    nonce: nonce,
  );
}