import 'package:calificaciones/src/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context) => LoginPage()
      },
    );
  }
}