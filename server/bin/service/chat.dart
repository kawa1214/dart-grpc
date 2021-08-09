import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:server/src/generated/chat.pbgrpc.dart';

class ChatService extends ChatServiceBase {
  final _controller = StreamController<Feature>();

  @override
  Future<ChatReplay> sayHello(ServiceCall call, ChatRequest request) async {
    _controller.add(Feature(message: request.message));
    return ChatReplay()..message = 'Hi! Hello, ${request.message}!';
  }

  @override
  Stream<Feature> listFeatures(ServiceCall call, ChatRequest request) async* {
    await for (final item in _controller.stream) {
      yield item;
    }
  }

  @override
  Future<ChatReplay> puchChat(ServiceCall call, ChatRequest request) async {
    return ChatReplay()..message = 'Hi! Hello, ${request.message}!';
  }
}
