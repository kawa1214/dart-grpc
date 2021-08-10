///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use postRequestDescriptor instead')
const PostRequest$json = const {
  '1': 'PostRequest',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.user.UserRequest', '10': 'user'},
    const {'1': 'message', '3': 2, '4': 1, '5': 11, '6': '.chat.MessageRequest', '10': 'message'},
  ],
};

/// Descriptor for `PostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postRequestDescriptor = $convert.base64Decode('CgtQb3N0UmVxdWVzdBIlCgR1c2VyGAEgASgLMhEudXNlci5Vc2VyUmVxdWVzdFIEdXNlchIuCgdtZXNzYWdlGAIgASgLMhQuY2hhdC5NZXNzYWdlUmVxdWVzdFIHbWVzc2FnZQ==');
@$core.Deprecated('Use postReplayDescriptor instead')
const PostReplay$json = const {
  '1': 'PostReplay',
  '2': const [
    const {'1': 'succeeded', '3': 1, '4': 1, '5': 8, '10': 'succeeded'},
  ],
};

/// Descriptor for `PostReplay`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postReplayDescriptor = $convert.base64Decode('CgpQb3N0UmVwbGF5EhwKCXN1Y2NlZWRlZBgBIAEoCFIJc3VjY2VlZGVk');
@$core.Deprecated('Use listPostsReplayDescriptor instead')
const ListPostsReplay$json = const {
  '1': 'ListPostsReplay',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.user.UserRequest', '10': 'user'},
    const {'1': 'message', '3': 2, '4': 1, '5': 11, '6': '.chat.MessageRequest', '10': 'message'},
  ],
};

/// Descriptor for `ListPostsReplay`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPostsReplayDescriptor = $convert.base64Decode('Cg9MaXN0UG9zdHNSZXBsYXkSJQoEdXNlchgBIAEoCzIRLnVzZXIuVXNlclJlcXVlc3RSBHVzZXISLgoHbWVzc2FnZRgCIAEoCzIULmNoYXQuTWVzc2FnZVJlcXVlc3RSB21lc3NhZ2U=');
@$core.Deprecated('Use messageRequestDescriptor instead')
const MessageRequest$json = const {
  '1': 'MessageRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `MessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageRequestDescriptor = $convert.base64Decode('Cg5NZXNzYWdlUmVxdWVzdBIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');
