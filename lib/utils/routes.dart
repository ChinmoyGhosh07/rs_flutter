
import 'package:flutter/material.dart';
import 'package:retailershakti_flutter/home/home_page.dart';
import 'package:retailershakti_flutter/home/splash_page.dart';
import 'package:retailershakti_flutter/live_cart/presentation/live_cart_page.dart';
import 'package:retailershakti_flutter/login/presentation/login_page.dart';

import '../live_cart/cart_payment_page.dart';

class MyRoutes {
  static const String splash = "/splash";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String cartMain = "/cart";
  static const String payment = "/payment";
  static const String homeWebViewRoute = "/home_webview_landing";


  static Route<dynamic> generateRoutes(RouteSettings settings){

    switch(settings.name){
      case splash:
        return MaterialPageRoute(builder: (BuildContext context) => SplashPage());
      case loginRoute:
        return MaterialPageRoute(builder: (BuildContext context) => LoginPage());
      case homeRoute:
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      case cartMain:
        return MaterialPageRoute(builder: (BuildContext context) => LiveCartPage());
      case payment:
        return MaterialPageRoute(builder: (BuildContext context) => CartPaymentPage());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}