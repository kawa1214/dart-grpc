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
export 'chat.pb.dart';

class ChatClient extends $grpc.Client {
  static final _$sayHello = $grpc.ClientMethod<$0.ChatRequest, $0.ChatReplay>(
      '/chat.Chat/SayHello',
      ($0.ChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatReplay.fromBuffer(value));
  static final _$listFeatures = $grpc.ClientMethod<$0.ChatRequest, $0.Feature>(
      '/chat.Chat/ListFeatures',
      ($0.ChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Feature.fromBuffer(value));
  static final _$puchChat = $grpc.ClientMethod<$0.ChatRequest, $0.ChatReplay>(
      '/chat.Chat/puchChat',
      ($0.ChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatReplay.fromBuffer(value));

  ChatClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ChatReplay> sayHello($0.ChatRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sayHello, request, options: options);
  }

  $grpc.ResponseStream<$0.Feature> listFeatures($0.ChatRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listFeatures, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.ChatReplay> puchChat($0.ChatRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$puchChat, request, options: options);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.Chat';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ChatRequest, $0.ChatReplay>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatRequest.fromBuffer(value),
        ($0.ChatReplay value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatRequest, $0.Feature>(
        'ListFeatures',
        listFeatures_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ChatRequest.fromBuffer(value),
        ($0.Feature value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatRequest, $0.ChatReplay>(
        'puchChat',
        puchChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatRequest.fromBuffer(value),
        ($0.ChatReplay value) => value.writeToBuffer()));
  }

  $async.Future<$0.ChatReplay> sayHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ChatRequest> request) async {
    return sayHello(call, await request);
  }

  $async.Stream<$0.Feature> listFeatures_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ChatRequest> request) async* {
    yield* listFeatures(call, await request);
  }

  $async.Future<$0.ChatReplay> puchChat_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ChatRequest> request) async {
    return puchChat(call, await request);
  }

  $async.Future<$0.ChatReplay> sayHello(
      $grpc.ServiceCall call, $0.ChatRequest request);
  $async.Stream<$0.Feature> listFeatures(
      $grpc.ServiceCall call, $0.ChatRequest request);
  $async.Future<$0.ChatReplay> puchChat(
      $grpc.ServiceCall call, $0.ChatRequest request);
}
