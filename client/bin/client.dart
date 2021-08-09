import 'package:args/args.dart';
import 'package:grpc/grpc.dart';
import 'package:server/src/generated/chat.pbgrpc.dart';
import 'dart:io';
import 'package:collection/collection.dart';

Future<void> main(List<String> args) async {
  final parser = ArgParser()..addOption('name');
  final parsedArgs = parser.parse(args);

  final name = parsedArgs['name'] ?? 'default';

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
  streamKeyboardEvent().listen((event) async {
    switch (event) {
      case KeyboardEvent.input:
        print('メッセージを入力してください');
        final input = readLine();
        print('input: $input');
        await chatClient.sayHello(ChatRequest(message: input));
        return;
      case KeyboardEvent.quiet:
        // TODO: 終了する
        return await channel.shutdown();
      case KeyboardEvent.none:
        return;
    }
  });
  try {
    final response = chatClient.listFeatures(
      ChatRequest()..message = 'test',
      options: CallOptions(compression: const GzipCodec()),
    );
    await for (final e in response) {
      print(e);
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

Stream<KeyboardEvent> streamKeyboardEvent() {
  final stream = stdin.asyncMap((event) {
    final keyboardEvent = KeyboardEventExtension.fromIntList(event);
    return keyboardEvent;
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
