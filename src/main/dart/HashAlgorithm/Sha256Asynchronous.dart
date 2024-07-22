import 'package:cryptography/cryptography.dart';

Future<void> main() async {
  final message = <int>[1,2,3];
  final algorithm = Sha256();
  final hash = await algorithm.hash(message);
  print('Hash: ${hash.bytes}');
}