# dart

## start server

```
cd server && docker-compose up -d
```

or

```
cd server && dart run --enable-vm-service --disable-service-auth-codes
```

## start client

```
cd client && dart run
```

## development

```sh
$ pub global activate protoc_plugin
```

```sh
$ protoc --dart_out=grpc:lib/src/generated -Iprotos protos/*.proto
```

## grpc documents

命名規則

https://cloud.google.com/apis/design/naming_convention

https://grpc.io/docs/what-is-grpc/introduction/

https://grpc.io/docs/languages/dart/basics/

# gRPC introduction
https://grpc.io/docs/what-is-grpc/introduction/


## 概要

gRPCは，クライアントからローカルオブジェクトのようにメソッドを直接呼び出すことができることから，分散アプリケーションやサービスを簡単に作成できる．

gRPCでは，サービスを定義（パラメータと返り値）し，メソッドを呼び出す．

## プロトコルバッファ

データの構造を表すプロトコルバッファはつぎのように表せる
https://developers.google.com/protocol-buffers/docs/overview

```proto
message Person {
    string name = 1;
    int32 id = 2;
    bool has_ponycopter = 3;
}
```

プロトコルバッファコンパイラprotocを使用し，プロトコル定義からデータアクセスクラスを定義する．

gRPCでは，プラグインを使用しプロトファイルからコードを生成することができる．生成したコードのクラスを用いて，プロトコルバッファメッセージの入力，シリアル化，取得ができる

```proto
// The greeter service definition.
service Greeter {
    // Sends a greeting
    rpc SayHello (HelloRequest) returns (HelloReply) {}
}

// The request message containing the user's name.
message HelloRequest {
    string name = 1;
}

// The response message containing the greetings
message HelloReply {
    string message = 1;
}
```

## バージョン
dartではProto3を仕様することができ，構文の簡略化，追加機能がある．

クライアントとサーバにおいて，protoのバージョンを揃えやすくするために，proto3を使用することが推奨されている．

# Dart gRPC チュートリアル

## なぜgRPC

protoを定義することで，言語間のクライアントとサーバのデータを定義できる．

## サービスの定義

`service`は`.proto`ファイルで定義する．

```proto
service RouteGuide {
    // TODO
}
```

`rpc`はサービス定義内のメソッドとして定義する．リクエストと返り値を指定する．
gRPCでは４パターンのサービスを定義できる．

```proto
service RouteGuide {
    // 通常の関数のように，返り値を期待しリクエストするパターン
    rpc GetFeature(Point) returns (Feature) {}

    // クライアントがサーバにリクエストを送信し，メッセージのバックのシーケンスを読み取るためのストリームを取得するパターン
    // クライアントは，サーバ側のデータをメッセージがなくなるまで，返されたストリームから読み取る．
    rpc ListFeatures(Rectangle) returns (stream Feature) {}

    // クライアント側がストリームを使用してサーバに送信する．
    // クライアントがメッセージの書き込みを終了すると，サーバがメッセージを全て読み取り，応答を返すのを待つ．
    rpc RecordRoute(stream Point) returns (RouteSummary) {}

    // 双方向ストリーミング
    // クライアントとサーバの両側が読み書きをストリームし，一連のメッセージを送信する．
    // ２つのストリームは独立して動作ｓるうため，クライアントとサーバは任意の順序で読み取りと書き込みを行うことがでkリウ．
    // ex. サーバは書き込む前に全てのクライアントからのメッセージの受信を待機する or メッセージを交互に読み取ってからメッセージを書き込む or 読み取りと書き込みのその他の組み合わせ
    rpc RouteChat(stream RouteNote) returns (stream RouteNote) {}
}

```

## サーバ

RouteGuideには２つの機能がある
  - サービス定義から生成されたインターフェイスの実装
  - gRPCサーバを実行してクライアントからのリクエストをリッスンし，適切なサービス実装にdispatchする

```dart
class RouteGuideService extends RouteGuideServiceBase {
    Future<Feature> getFeature(grpc.ServiceCall call, Point request) async {
        // TODO
    }

    Stream<Feature> listFeatures(grpc.ServiceCall call, Rectangle request) async* {
        // TODO
    }

    Future<RouteSummary> recordRoute(grpc.ServiceCall call, Stream<Point> request) async {
        // TODO
    }

    Stream<RouteNote> routeChat(grpc.ServiceCall call, Stream<RouteNote> request) async* {
        // TODO
    }
}
```
TODO:
- [ ] チャット機能実装
- [ ] ドキュメントの追加
- [ ] DBの永続化

https://christina04.hatenablog.com/entry/go-clean-architecture