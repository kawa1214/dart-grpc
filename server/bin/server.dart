import 'package:grpc/grpc.dart';
import 'package:server/src/generated/protos/helloworld.pbgrpc.dart';

class GreeterService extends GreeterServiceBase {
  @override
  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request) async {
    return HelloReply()..message = 'Hi! Hello, ${request.name}!';
  }
}

Future<void> main(List<String> args) async {
  final server = Server(
    [GreeterService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 5001);
  print('Server listening on http://localhost://${server.port}');
  print('port : ${server.port}');
}
