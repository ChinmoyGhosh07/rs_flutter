

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {



  static void flushBarMessage(String message,BuildContext context){
    Flushbar(
      title: "Failed Login",
      message: message,
      flushbarPosition: FlushbarPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}