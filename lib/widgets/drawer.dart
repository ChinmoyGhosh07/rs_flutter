import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final imageLink = "https://source.unsplash.com/user/c_v_r/1600x900";

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountEmail: Text("cghosh@gmail.com"),
              accountName: Text("Chinmoy Ghosh"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageLink),
              ),
            ),
          ),
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