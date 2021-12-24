import 'package:flutter/material.dart';
import 'second_file.dart';

void main() => runApp( MyClass() );

class MyClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Flutter App",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Title'),
        ),
        body: SecondClass(),
      ),
    );
  }
}