# dart

## start server

```
cd server && docker-compose up -d
```

or

```
cd server && dart run
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
$ protoc --dart_out=grpc:lib/src/generated -Iprotos protos/helloworld.proto
```

## grpc documents

https://grpc.io/docs/what-is-grpc/introduction/

https://grpc.io/docs/languages/dart/basics/
