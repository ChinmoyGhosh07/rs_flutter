import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:retailershakti_flutter/api_service/service_url.dart';
import 'package:retailershakti_flutter/login/data/remote/login_client.dart';
import 'package:logger/logger.dart';

class AuthClient{
  final Dio _dio = Dio();



  static Future<dynamic> loginWithPassword(String mobile, String password) async{

    final logger = Logger();

    var client = LoginClient(Dio(BaseOptions(
        baseUrl: ServiceUrl.rsPostUrl,
        contentType: "application/json",
        receiveDataWhenStatusError: true,
        connectTimeout: 60*1000, // 60 seconds
        receiveTimeout: 60*1000 // 60 seconds
    )));

    final Map<String, dynamic> loginData = {
      'UserName': mobile,
      'Password': password
    };

    client.loginWithPassword(loginData).then((it) => logger.i(it));


    /*final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        headers: {});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }*/
  }

  Future<Response> otpVerifyForLogin(String mobile, String password) async{
    try {
      Response response = await _dio.post(
        'https://api.loginradius.com/identity/v2/auth/login',
        data: {
          'email': mobile,
          'password': password
        },
        queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      //returns the successful user data json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }

  Future<Response> chkMobileNoExist(String mobile, String password) async{
    try {
      Response response = await _dio.post(
        'https://api.loginradius.com/identity/v2/auth/login',
        data: {
          'email': mobile,
          'password': password
        },
        queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      //returns the successful user data json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }

  Future<Response> getOtpForLogin(String mobile, String password) async{
    try {
      Response response = await _dio.post(
        'https://api.loginradius.com/identity/v2/auth/login',
        data: {
          'email': mobile,
          'password': password
        },
        queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      //returns the successful user data json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }
}