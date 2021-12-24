import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new Application()));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> {

  double svalue = 3.0;
  void method1(val){
    setState((){
      svalue = val;
      print('$svalue');
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
          child: new Slider(value: svalue, min: 1.0, max: 10.0, onChanged:(double value){method1(value);}),
        )
    );
  }
}