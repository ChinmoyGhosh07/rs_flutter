

import '../../../api_service/network/BaseApiServices.dart';
import '../../../api_service/network/NetworkApiService.dart';
import '../../../api_service/service_url.dart';

class LoginRepository {

  BaseApiServices _apiServices = NetworkApiService() ;

  Future<dynamic> checkUserExist(dynamic data )async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(ServiceUrl.rsPostUrl, data);
      return response ;

    }catch(e){
      throw e ;
    }
  }

  Future<dynamic> loginWithPasswordApi(dynamic data )async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(ServiceUrl.rsPostUrl, data);
      return response ;

    }catch(e){
      throw e ;
    }
  }

  Future<dynamic> loginWithOtpApi(dynamic data )async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(ServiceUrl.rsPostUrl, data);
      return response ;

    }catch(e){
      throw e ;
    }
  }
}