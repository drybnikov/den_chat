import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ClientProvider {
  final _authDio = Dio();

  ClientProvider() {
    _initDio();
  }

  Dio get client => _authDio;

  void _initDio() {
    _authDio.options
      ..connectTimeout = 60000 //60s
      ..receiveTimeout = 60000
      ..headers = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'accept-language': 'en-GB,en-US',
      }
      ..contentType = Headers.jsonContentType;

    if (kDebugMode) {
      _authDio.interceptors.add(_networkLogInterceptor);
    }
  }
}

LogInterceptor _networkLogInterceptor = LogInterceptor(
  responseBody: true,
  requestBody: true,
);
