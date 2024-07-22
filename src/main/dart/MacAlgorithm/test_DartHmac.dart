import 'package:cryptography/cryptography.dart';
import 'package:cryptography/dart.dart';

void main() {
  final algorithm = DartHmac.sha256();
  final mac = algorithm.calculateMacSync(
    bytes,
    secretKey: secretKey,
  );
}