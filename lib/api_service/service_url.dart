
import 'package:retailershakti_flutter/utils/app_flavour_config.dart';

class ServiceUrl{

  static String rsGetUrl = getBaseUrl(ApiDomain.rsBaseUrl) + 'index_v2/get';
  static String rsPostUrl = getBaseUrl(ApiDomain.rsBaseUrl) + 'index_v2/post';

   static String getBaseUrl(ApiDomain section){

    var isProduction = AppFlavourConfig().isProduction();

    switch(section){
      case ApiDomain.rsBaseUrl:
        if(isProduction){
        return "https://www.retailershakti.com/";
      } else {
        return "https://nw-stg.retailershakti.com/";
      }
        break;
      case ApiDomain.search:
        if(isProduction){
          return "https://www.retailershakti.com/";
        } else {
          return "https://nw-stg.retailershakti.com/";
        }
        break;
    }
  }
}

  enum ApiDomain {
    rsBaseUrl, search
  }