import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../api_service/service_url.dart';

part 'login_client.g.dart';

@RestApi()
abstract class LoginClient{

  factory LoginClient(Dio dio) {

    dio.options = BaseOptions(
        //baseUrl: ServiceUrl.getBaseUrl(ApiDomain.rsBaseUrl),
        baseUrl: ServiceUrl.rsPostUrl,
        receiveTimeout: 30000,
        connectTimeout: 30000,
        contentType: 'application/json',
        /* If needed headers */
        headers: {
          'Authorization': 'Basic ZGlzYXBpdXNlcjpkaXMjMTIz',
          'X-ApiKey': 'ZGslzIzEyMw==',
          'Content-Type': 'application/json'
        }
    );

    return _LoginClient(dio);
  }

  Future loginWithPassword(@Body() Map<String,dynamic> body);

}