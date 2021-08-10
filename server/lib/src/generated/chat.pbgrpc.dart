///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat.pb.dart' as $0;
import 'user.pb.dart' as $1;
export 'chat.pb.dart';

class ChatClient extends $grpc.Client {
  static final _$createPost = $grpc.ClientMethod<$0.PostRequest, $0.PostReplay>(
      '/chat.Chat/createPost',
      ($0.PostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PostReplay.fromBuffer(value));
  static final _$listPosts =
      $grpc.ClientMethod<$1.UserRequest, $0.ListPostsReplay>(
          '/chat.Chat/ListPosts',
          ($1.UserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListPostsReplay.fromBuffer(value));

  ChatClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.PostReplay> createPost($0.PostRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPost, request, options: options);
  }

  $grpc.ResponseStream<$0.ListPostsReplay> listPosts($1.UserRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listPosts, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.Chat';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PostRequest, $0.PostReplay>(
        'createPost',
        createPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PostRequest.fromBuffer(value),
        ($0.PostReplay value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UserRequest, $0.ListPostsReplay>(
        'ListPosts',
        listPosts_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.UserRequest.fromBuffer(value),
        ($0.ListPostsReplay value) => value.writeToBuffer()));
  }

  $async.Future<$0.PostReplay> createPost_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PostRequest> request) async {
    return createPost(call, await request);
  }

  $async.Stream<$0.ListPostsReplay> listPosts_Pre(
      $grpc.ServiceCall call, $async.Future<$1.UserRequest> request) async* {
    yield* listPosts(call, await request);
  }

  $async.Future<$0.PostReplay> createPost(
      $grpc.ServiceCall call, $0.PostRequest request);
  $async.Stream<$0.ListPostsReplay> listPosts(
      $grpc.ServiceCall call, $1.UserRequest request);
}
