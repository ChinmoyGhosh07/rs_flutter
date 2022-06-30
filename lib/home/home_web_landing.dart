
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class HomeWebLandingPage extends StatefulWidget {
  //const HomeWebLandingPage({Key? key}) : super(key: key);

  final url;
  HomeWebLandingPage(this.url);

  @override
  State<HomeWebLandingPage> createState() => _HomeWebLandingPageState(this.url);
}

class _HomeWebLandingPageState extends State<HomeWebLandingPage> {
  var _url;
  final _key = UniqueKey();

  _HomeWebLandingPageState(this._url);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: WebView(
                key: _key,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: _url)
        )
      ),
    );
  }
}
