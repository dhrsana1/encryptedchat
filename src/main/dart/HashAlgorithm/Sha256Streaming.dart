import 'package:cryptography/cryptography.dart';

void main() async {
  // Create a sink
  final algorithm = Sha256();
  final sink = algorithm.newSink();

  // Add any number of chunks
  sink.add(<int>[1,2,3]);
  sink.add(<int>[4,5]);

  // Calculate the hash
  sink.close();
  final hash = await sink.hash();
  print('Hash: ${hash.bytes}');
}