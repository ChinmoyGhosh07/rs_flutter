import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:retailershakti_flutter/api_service/app_exceptions.dart';
import 'package:retailershakti_flutter/api_service/network/BaseApiServices.dart';

class NetworkApiService extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async{

    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnresponse(response);

    }on SocketException{
      throw FetchDataException('No internet connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try{
      Response response = await http.post(Uri.parse(url),
      body: data).timeout(Duration(seconds: 10));
      responseJson = returnresponse(response);

    }on SocketException{
      throw FetchDataException('No internet');
    }

    return responseJson;
  }

  dynamic returnresponse(http.Response response){

    switch(response.statusCode){
      case 200 :
        dynamic responseCode = jsonDecode(response.body);
        return responseCode;
      case 400 :
        throw BadRequestException(response.statusCode.toString());
      case 404 :
        throw UnauthorisedException(response.statusCode.toString());
      default :
        throw FetchDataException('Error occurred with communication with server '+ 'with status code '+ response.statusCode.toString());
    }
  }

}