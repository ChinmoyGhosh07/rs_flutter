import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:retailershakti_flutter/api_service/auth/auth_client.dart';
import 'package:retailershakti_flutter/login/presentation/forgot_password.dart';

import 'package:retailershakti_flutter/utils/routes.dart';

import '../provider/auth_provider.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  int grpExistingUser = 1;

  TextEditingController phone = TextEditingController(text: "");
  TextEditingController pass = TextEditingController(text: "");
  TextEditingController businessName = TextEditingController(text: "");
  bool _checkLoginWithOtp = true;
  bool _checkWhatsAppConsent = true;
  final double  _minimumPadding = 4.0;
  String _mobileNo = "", _password = "";

  onForgotClick(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ForgotPassword()));
  }

  moveToHome(BuildContext context) async{

    var state = _formKey.currentState;
    if(state != null && state.validate()){
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      //await Navigator.pushNamed(context, MyRoutes.homeRoute);
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    //AuthProvider auth = Provider.of<AuthProvider>(context);

    submit() async {

      var state = _formKey.currentState;
      if(state != null && state.validate()){
        state.save();

        //final Future<Map<String,dynamic>> respose =  auth.loginWithPassword(_mobileNo,_password);
        final Future<Map<String,dynamic>> respose =  await AuthClient.loginWithPassword(_mobileNo,_password);

        respose.then((response) {
          if (response['status']) {

            //User user = response['user'];

            //Provider.of<UserProvider>(context, listen: false).setUser(user);

            Navigator.pushReplacementNamed(context, '/dashboard');

          } else {
            Flushbar(
              title: "Failed Login",
              message: response['message']['message'].toString(),
              duration: Duration(seconds: 3),
            ).show(context);
          }
        });

      } else {
        // toast
        Flushbar(
          title: "Failed Login",
          message: 'Please complete the form properly',
          duration: Duration(seconds: 10),
        ).show(context);
      }


      if(_checkLoginWithOtp && phone.text.isNotEmpty){
        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const OtpScreen()));
      }
      if(!_checkLoginWithOtp && phone.text.isNotEmpty && pass.text.isNotEmpty){
        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Home()));
      }

    }

    //TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 24,
              ),
              Image.asset("assets/images/logo_big.png",
                width: 180,
                height: 64,
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(padding: const EdgeInsets.all(12),
                child: Column(
                  children: [

                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: grpExistingUser,
                          onChanged: (value) {
                            setState(() {
                              grpExistingUser = 1;
                            });
                          },
                        ),
                        const Expanded(child: Text("Existing User")),
                        Radio(
                          value: 0,
                          groupValue: grpExistingUser,
                          onChanged: (value) {
                            setState(() {
                              grpExistingUser = 0;
                            });
                          },
                        ),
                        const Expanded(child: Text("New User")),
                      ],
                    ),
                    // business name
                    Padding(padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
                      child: Visibility(
                        visible: (0 == grpExistingUser),
                        child: TextFormField(
                            controller: businessName,
                            decoration:  InputDecoration(
                              labelText: "business/Shop Name*",
                              //hintText: "Enter business/Shop Name",
                              //labelStyle: textStyle,
                              errorStyle: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 15.0
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            validator: (_){
                              if(businessName.text.isEmpty) {
                                return "Enter a valid business/Shop Name";
                              }
                            }
                        ),
                      ),
                    ),

                    // mobile number
                    Padding(padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      onSaved: (value)=> _mobileNo = value ?? '',
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      maxLines: 1,
                      inputFormatters: <TextInputFormatter>[
                        // for below version 2 use this
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(10),
                        // for version 2 and greater youcan also use this
                        FilteringTextInputFormatter.digitsOnly

                      ],
                      decoration: InputDecoration(
                        //hintText: "Enter mobile number",
                        labelText: "Enter mobile number",
                        errorStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15.0
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if("" == value){
                          return "Mobile number can not be blank";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name = value;
                        setState(() {});
                      },
                    ),),

                    //password
                    Padding(padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
                      child: Visibility(
                        visible: (!_checkLoginWithOtp && 1 == grpExistingUser) ,
                        child: TextFormField(
                            onSaved: (value)=> _password = value ?? '',
                            controller: pass,
                            decoration:  InputDecoration(
                              labelText: "Enter your Password",
                              //hintText: "Enter your Password",
                              errorStyle: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 15.0
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            validator: (_){
                              if(pass.text.isEmpty) {
                                return "Enter a valid password";
                              }
                            }
                        )),),

                    /*TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter OTP",
                        labelText: "OTP",

                      ),
                      validator: (value) {
                        if("" == value){
                          return "OTP can not be blank";
                        }
                        return null;
                      },
                    ),*/
                    //login with otp check
                    Visibility(
                      visible: 1 == grpExistingUser,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(value: _checkLoginWithOtp, onChanged: (bool? newValue) {
                              setState(() {
                                _checkLoginWithOtp = newValue!;
                              });
                            },),//onChanged: onChangeCheck(checkValue)),
                            const Text("Login with OTP"),
                          ],
                        )),

                    const SizedBox(
                      height: 8,
                    ),
                    // login button
                    SizedBox(
                      width: 400,
                      child: ElevatedButton(onPressed: submit,
                          child: !_checkLoginWithOtp ? const Text("Login") : const Text("Continue")),
                    ),

                    //term and condition
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: Text("By clicking Proceed, you agree to our Terms and Conditions",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 4,
                    ),
                    //whatsapp consent check
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(value: _checkWhatsAppConsent, onChanged: (bool? newValue) {
                          setState(() {
                            _checkWhatsAppConsent = newValue!;
                          });
                        },),//onChanged: onChangeCheck(checkValue)),
                        const Text("WhatApp consent"),
                      ],
                    ),

                    const SizedBox(
                      height: 8,
                    ),
                    // forgot password
                    TextButton(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      onPressed: onForgotClick,
                      child: const
                        Text("Forgot Password?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //app for retailer
                    Container(
                      color: Colors.yellow,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Expanded(child: Text("This app is not for consumers."
                              "Retailer can get registered and can order only when proof of business is verified."
                              "(Upload proof of business such as Drug license, Trade license, GST)",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal
                            ),),)

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //video list
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("English",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /*Material(
                color: Colors.deepPurple,
                borderRadius:
                    BorderRadius.circular(changeButton?50:8),
                child: InkWell(
                  onTap: () => moveToHome(context),

                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changeButton? 50 : 150,
                    height: 50,

                    alignment: Alignment.center,
                    child: changeButton?Icon(
                        Icons.done,
                        color: Colors.white
                    ):
                    Text("Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ),
              )*/

            ],
          ),
        ),
      ),

    );
  }
}