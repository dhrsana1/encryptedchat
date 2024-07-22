import 'package:cryptography/cryptography.dart';

Future<void> main() async {
  final algorithm = Blake2b();
  final message = <int>[1,2,3];
  final hash = await algorithm.hash(message);
  print('Hash: ${hash.bytes}');
}