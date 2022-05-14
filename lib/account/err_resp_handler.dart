import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class ErrorResponseHandler{

  const ErrorResponseHandler();

  Future<bool> apply({
    Response? response,
    required Function onError});

}