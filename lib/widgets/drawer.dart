import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retailershakti_flutter/login/presentation/login_page.dart';

class MyDrawer extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _DrawerState();

}

class _DrawerState extends State<MyDrawer>{

  _login(){
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {

    final imageLink = "https://source.unsplash.com/user/c_v_r/1600x900";

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Row(children: [
              const Text("Hi, Guest"),
              TextButton(
                //mainAxisAlignment: MainAxisAlignment.center,
                onPressed: _login,
                child: const
                Text("Login/Register",
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],),
          ),
          /*DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountEmail: Text("cghosh@gmail.com"),
                accountName: Text("Chinmoy Ghosh"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageLink),
                ),
              ),
            ),*/

          ListTile(
            leading: Icon(CupertinoIcons.home,
                color: Colors.blueGrey),
            title: Text("Home",
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled,
                color: Colors.blueGrey),
            title: Text("Profile",
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail,
                color: Colors.blueGrey),
            title: Text("Email me",
              textScaleFactor: 1.2,
            ),
          )
        ],
      ),
    );
  }
}