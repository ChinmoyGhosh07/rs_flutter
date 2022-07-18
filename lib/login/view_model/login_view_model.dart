
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:retailershakti_flutter/login/data/remote/login_client.dart';

import '../../utils/utils.dart';
import '../data/repository/login_repository.dart';

class LoginViewModel extends ChangeNotifier{

  final _myRepo = LoginRepository();

  bool _loading = false ;
  bool get loading => _loading ;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginWithPassword(dynamic data,BuildContext context) async {
    setLoading(true);

    _myRepo.loginWithPasswordApi(data).then((value){
      setLoading(false);
      /*final userPreference = Provider.of<UserViewModel>(context , listen: false);
      userPreference.saveUser(
          UserModel(
              token: value['token'].toString()
          )
      );*/

      Utils.flushBarMessage('Login Successfully', context);
      //Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());

      }
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }

  Future<void> loginWithOtp(dynamic data,BuildContext context) async {
    setLoading(true);

    _myRepo.loginWithPasswordApi(data).then((value){
      setLoading(false);
      /*final userPreference = Provider.of<UserViewModel>(context , listen: false);
      userPreference.saveUser(
          UserModel(
              token: value['token'].toString()
          )
      );*/

      Utils.flushBarMessage('Login Successfully', context);
      //Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());

      }
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }

  Future<void> checkUserExist(dynamic data,BuildContext context) async {
    setLoading(true);

    _myRepo.checkUserExist(data).then((value){
      setLoading(false);
      /*final userPreference = Provider.of<UserViewModel>(context , listen: false);
      userPreference.saveUser(
          UserModel(
              token: value['token'].toString()
          )
      );*/

      Utils.flushBarMessage('Login Successfully', context);
      //Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());

      }
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }
}