import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:retailershakti_flutter/home/home_page.dart';
import 'package:retailershakti_flutter/home/home_web_landing.dart';
import 'package:retailershakti_flutter/home/splash_page.dart';
import 'package:retailershakti_flutter/login/presentation/login_page.dart';
import 'login/view_model/login_view_model.dart';
import 'utils/routes.dart';
import 'widgets/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> LoginViewModel())
    ],
      child: MaterialApp(
        /*if specify home then remove "/" do not keep both*/
        //home: HomePage(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: MyTheme.homeTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        initialRoute: MyRoutes.splash,
        onGenerateRoute: MyRoutes.generateRoutes,
        /*routes: {
          "/": (context) => SplashPage(), //HomeWebLandingPage("https://www.genupathlabs.com/"),
          MyRoutes.homeRoute  : (context) => HomePage(),
          MyRoutes.loginRoute : (context) => LoginPage(),
          //MyRoutes.homeWebViewRoute : (context) => HomeWebLandingPage("https://www.retailershakti.com/")
        },*/
      ),
    );
  }
}

