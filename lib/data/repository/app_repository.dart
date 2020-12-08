import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:king_bank/constrants/preference_key.dart';
import 'package:king_bank/data/model/login/results_login.dart';
import 'package:king_bank/data/model/register/results_register.dart';
import 'LoggingInterceptor.dart';
import 'handle_error.dart';

class AppRepository {
  static const TAG = 'AuthRepository';

  Dio _dio;
  static final AppRepository _instance = AppRepository._internal();

  factory AppRepository() => _instance;

  AppRepository._internal() {
    _dio = Dio();
    _dio.options.baseUrl = PreferenceKey.BASE_API;
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.connectTimeout = 20000;
    _dio.interceptors.add(LoggingInterceptor());
  }

  Future<Map<String, dynamic>> handlerResponse(Future<Response> handle) async {
    try {
      Response response = await handle;
      return response.data;
    } on DioError catch (error) {
      print("res error---${error.response}");
      return handlerError(error);
    }
  }

  Future<ResultsLogin> signIn(params) async {
    final request = _dio.post("login", queryParameters: params);
    final response = await handlerResponse(request);
    return ResultsLogin.fromJson(response);
  }

  Future<ResultsRegister> signUp(params) async {
    FormData formData = new FormData.fromMap(params);
    final request = _dio.post("register",
        data: formData);
    final response = await handlerResponse(request);
    return ResultsRegister.fromJson(response);
  }

}