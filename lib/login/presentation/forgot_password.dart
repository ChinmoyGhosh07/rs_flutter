import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();

}

class _ForgotPasswordState extends State<ForgotPassword>{

  TextEditingController emailOrMobile = TextEditingController(text: "");
  final double  _minimumPadding = 4.0;

  submit(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: Form(
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
              const Padding(padding: EdgeInsets.all(4),
              child: Expanded(child: Text("Forgot your Password?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.indigo,
                  //decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),),
              ),),

              const SizedBox(
                height: 4,
              ),

              const Expanded(child: Text("A temporary password will be sent to your registered mobile number or email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  //decoration: TextDecoration.underline,
                  fontWeight: FontWeight.normal,
                ),
              )),
              const SizedBox(
                height: 8,
              ),
              // enter email/mobile
              Padding(padding: EdgeInsets.all(4),
              child: TextFormField(
                  controller: emailOrMobile,
                  decoration:  InputDecoration(
                    labelText: "Enter email / mobile number*",
                    //hintText: "Enter business/Shop Name",
                    //labelStyle: textStyle,
                    errorStyle: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15.0
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  validator: (_){
                    if(emailOrMobile.text.isEmpty) {
                      return "Enter email / mobile number";
                    }
                  }
              ),),

              SizedBox(
                width: 400,
                child: ElevatedButton(onPressed: submit,
                    child: const Text("Submit")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}