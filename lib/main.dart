import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newsapp/views/home.dart';
import 'package:http/http.dart' as http;

class MyHttpoverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
    ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  } 
}

void main() {
  HttpOverrides.global=new MyHttpoverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dave\'s News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(     
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
