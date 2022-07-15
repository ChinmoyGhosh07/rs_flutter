
import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData homeTheme(BuildContext context) => ThemeData(
    appBarTheme: AppBarTheme(
        color: Colors.blue,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6
    ),
    primarySwatch: Colors.blue,
    //fontFamily: GoogleFonts
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark
  );
}