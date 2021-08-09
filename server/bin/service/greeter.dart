import 'package:grpc/grpc.dart';
import 'package:server/src/generated/helloworld.pbgrpc.dart';

class GreeterService extends GreeterServiceBase {
  @override
  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request) async {
    return HelloReply()..message = 'Hi! Hello, ${request.name}!';
  }
}
