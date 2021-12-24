import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';

void main() => runApp( MyClass() );

class MyClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Flutter App",
      routes: <String, WidgetBuilder> {
        '/screen1': (BuildContext context) => new SecondClass(),
        '/screen2': (BuildContext context) => new SecondPageClass(),
      },
      home: SecondClass(),
    );
  }
}