import 'package:flutter/material.dart';

import 'package:retailershakti_flutter/utils/routes.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

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
              Image.asset("assets/images/login.png",
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
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
                    TextFormField(
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
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
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
              )

              /*ElevatedButton(
                onPressed: () {
                  print("Hi RS user");
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
                style: TextButton.styleFrom(minimumSize: Size(200,40)),
                child: Text("Login"),

              )*/


            ],
          ),
        ),
      )

    );
  }
}