
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:retailershakti_flutter/login/data/remote/login_client.dart';

class AuthProvider extends ChangeNotifier{


  Future<Map<String, dynamic>> loginWithPassword(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'UserName': email,
      'Password': password
    };

    LoginClient apiService = LoginClient(dio.Dio());

    final response = await apiService.loginWithPassword(loginData);

    print('${response.toJson()}');

    if (response.statusCode == 200) {

      //save user to preference

      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': 'user obj'};

    } else {
      notifyListeners();
      result = {
        'status': false,
        'message': ''
      };
    }

      return result;
  }

  Future<Map<String, dynamic>> loginWithOtp(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'UserName': email,
      'Password': password
    };

    LoginClient apiService = LoginClient(dio.Dio());

    final response = await apiService.loginWithPassword(loginData);

    print('${response.toJson()}');

    if (response.statusCode == 200) {

    } else {

    }

    return result;
  }

  Future<Map<String, dynamic>> checkUserExist(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'UserName': email,
      'Password': password
    };

    LoginClient apiService = LoginClient(dio.Dio());

    final response = await apiService.loginWithPassword(loginData);

    print('${response.toJson()}');

    if (response.statusCode == 200) {

    } else {

    }

    return result;
  }
}