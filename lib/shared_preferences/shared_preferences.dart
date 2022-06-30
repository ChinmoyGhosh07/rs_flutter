

import 'package:shared_preferences/shared_preferences.dart';

saveUserOnBoard() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isUserOnBoarded', true);
}

Future<bool> isUserOnBoarded() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool boolValue = prefs.getBool('isUserOnBoarded') ?? false;
  return boolValue;
}