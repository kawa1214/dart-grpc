import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:server/src/generated/chat.pbgrpc.dart';
import 'package:server/src/generated/user.pb.dart';

class ChatService extends ChatServiceBase {
  final _controller = StreamController<ListPostsReplay>.broadcast();

  @override
  Future<PostReplay> createPost(ServiceCall call, PostRequest request) async {
    try {
      _controller.sink
          .add(ListPostsReplay(message: request.message, user: request.user));
      return PostReplay(succeeded: true);
    } catch (e) {
      return PostReplay(succeeded: false);
    }
  }

  @override
  Stream<ListPostsReplay> listPosts(
      ServiceCall call, UserRequest request) async* {
    await for (final item in _controller.stream) {
      yield item;
    }
  }
}
