import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:retailershakti_flutter/home/home_page.dart';
import 'package:retailershakti_flutter/login/presentation/login_page.dart';
import 'package:retailershakti_flutter/shared_preferences/shared_preferences.dart';

import '../utils/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

        constraints: const BoxConstraints.expand(),
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/images/splash_3_3.jpg"), fit: BoxFit.cover),
    )
    )
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, route);
  }

  route() async{
    final isOnBoarded = await isUserOnBoarded();
    log('isUserOnBoarded : $isOnBoarded');
    if(isOnBoarded) {
      Navigator.pushNamed(context,MyRoutes.homeRoute);
      /*Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => LoginPage()
      )
      );*/
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => HomePage()
      )
      );
      saveUserOnBoard();
    }
  }
}
