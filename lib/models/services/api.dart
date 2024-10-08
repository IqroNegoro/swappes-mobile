import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/storage/storage.dart';

class Api {
  Api._internal();

  static final Api _instance = Api._internal();

  factory Api() => _instance;

  static final Dio _dio = Dio(BaseOptions(baseUrl: "http://localhost:3001/"))
    ..interceptors.add(InterceptorsWrapper(
      onError: (error, handler) async {
        log("Error");
        if (error.response!.statusCode == 401) {
          final FutureOr<String> refresh =
              await Storage.get("refreshToken") ?? "";

          final response =
              await dio.post("info", data: {"refreshToken": refresh});

          await Storage.save("accessToken", response.data['accessToken']);
          await Storage.save("refreshToken", response.data['refreshToken']);

          error.requestOptions.headers['Authorization'] =
              response.data['accessToken'];

          return handler.resolve(await dio.fetch(error.requestOptions));
        }
        return handler.next(error);
      },
      onRequest: (options, handler) async {
        log("request");
        log(options.path);
        final FutureOr<String> token = await Storage.get("accessToken") ?? "";
        options.headers['authorization'] = 'Bearer $token';
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        log("response");
        return handler.next(response);
      },
    ));

  static Dio get dio => _dio;
}
