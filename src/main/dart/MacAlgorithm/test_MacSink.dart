import 'package:cryptography/cryptography.dart';

void main() {
  final secretKey = SecretKey([1,2,3]);

  // Create a sink
  final sink = Hmac(sha256).newSink(
    secretKey: secretKey,
  );

  // Add chunks of data
  sink.add([4,5,6]);
  sink.add([7,8]);

  // Close
  sink.close();

  // We now have a MAC
  final mac = sink.mac;

  print('MAC: ${mac.bytes');
}