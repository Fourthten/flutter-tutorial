import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Baby Names',
     home: LoginPage(),
     routes: {
       "/login": (_) => new MyHomePage(),
     },
   );
 }
}