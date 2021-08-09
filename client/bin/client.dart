import 'dart:convert';

import 'package:args/args.dart';
import 'package:grpc/grpc.dart';

import 'package:server/src/generated/chat.pbgrpc.dart';
import 'package:server/src/generated/user.pb.dart';
import 'dart:io';
import 'package:collection/collection.dart';

Future<void> main(List<String> args) async {
  final parser = ArgParser()..addOption('name');
  final parsedArgs = parser.parse(args);

  final name = parsedArgs['name'] as String;

  final channel = ClientChannel(
    'localhost',
    port: 5001,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry: CodecRegistry(
        codecs: const [GzipCodec(), IdentityCodec()],
      ),
    ),
  );

  final chatClient = ChatClient(channel);
  streamString().listen((event) async {
    await chatClient.sayHello(ChatRequest(message: event));
  });
  try {
    final response = chatClient.listFeatures(
      UserRequest()
        ..id = name
        ..name = name,
      options: CallOptions(compression: const GzipCodec()),
    );
    await for (final e in response) {
      print(e.message);
    }
  } catch (e) {
    print('Caught error: $e');
  }
}

String readLine() {
  final input = stdin.readLineSync();
  if (input == null) {
    throw Exception('TOOD: nullの場合を考慮');
  }
  return input;
}

Stream<String> streamString() {
  final stream = stdin
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .asyncMap((event) {
    return event;
  });
  return stream;
}

extension KeyboardEventExtension on KeyboardEvent {
  static KeyboardEvent fromIntList(List<int> event) {
    final keyboardEvent = _intListEventMap.entries
        .where((e) => ListEquality().equals(e.value, event))
        .toList();

    if (keyboardEvent.isEmpty) {
      return KeyboardEvent.none;
      throw Exception('定義されていないキー入力です');
    }

    return keyboardEvent.first.key;
  }

  static const _intListEventMap = {
    KeyboardEvent.input: [105, 10],
    KeyboardEvent.quiet: [113, 10],
  };
}

enum KeyboardEvent {
  input,
  quiet,
  none,
}
