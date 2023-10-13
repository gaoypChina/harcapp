import 'package:dio/dio.dart';

abstract class ErrorResponseHandler{

  const ErrorResponseHandler();

  Future<bool> apply({
    Response? response,
    required Function onError});

}