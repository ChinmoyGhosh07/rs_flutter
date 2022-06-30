

import 'package:dio/dio.dart';

class AppRepository {
  ApiClient _apiRequest;
  Dio dio;

  AppRepository() {
    dio = Dio();
    _apiRequest = ApiClient(dio);
  }
}