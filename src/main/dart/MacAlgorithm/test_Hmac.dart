import 'package:cryptography/cryptography.dart';

void main() async {
  final message = [1,2,3];
  final secretKey = SecretKey([4,5,6]);

  // In our example, we calculate HMAC-SHA256
  final hmac = Hmac.sha256();
  final mac = await hmac.calculateMac(
    message,
    secretKey: secretKey,
  );
}