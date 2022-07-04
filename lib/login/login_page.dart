import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:retailershakti_flutter/utils/routes.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  int group1Value = 0;
  int group2Value = 0;

  TextEditingController phone = TextEditingController(text: "");
  TextEditingController pass = TextEditingController(text: "");
  bool _checkValue = true;

  submit(){
    if(_checkValue && phone.text.isNotEmpty){
      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const OtpScreen()));
    }
    if(!_checkValue && phone.text.isNotEmpty && pass.text.isNotEmpty){
      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Home()));
    }

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
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/logo_big.png",
                fit: BoxFit.fitHeight,
                width: 400,
                height: 100,
              ),
              SizedBox(
                height: 8,
              ),
              /*Text("Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),*/
              Padding(padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: group1Value,
                          onChanged: (value) {
                            setState(() {
                              group1Value = 1;
                            });
                          },
                        ),
                        Expanded(child: Text("Existing User")),
                        Radio(
                          value: 2,
                          groupValue: group2Value,
                          onChanged: (value) {
                            setState(() {
                              group2Value = 2;
                            });
                          },
                        ),
                        Expanded(child: Text("New User")),
                      ],
                    ),
                    TextFormField(
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
                        hintText: "Enter mobile number",
                        labelText: "Mobile number",

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
                    ),
                    !_checkValue ?
                    TextFormField(
                        controller: pass,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your Password",
                        ),
                        validator: (_){
                          if(pass.text.isEmpty) {
                            return "Enter a valid password";
                          }
                        }
                    ) : const Text(""),
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
                    Row(
                      children: [
                        Checkbox(value: _checkValue, onChanged: (bool? newValue) {
                          setState(() {
                            _checkValue = newValue!;
                          });
                        },),//onChanged: onChangeCheck(checkValue)),
                        const Text("Login with OTP"),
                      ],
                    ),
                    Text("terms and condition",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Checkbox(value: _checkValue, onChanged: (bool? newValue) {
                          setState(() {
                            _checkValue = newValue!;
                          });
                        },),//onChanged: onChangeCheck(checkValue)),
                        const Text("WhatApp consent"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
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
              ElevatedButton(onPressed: submit, child: const Text("Submit"))

            ],
          ),
        ),
      )

    );
  }
}