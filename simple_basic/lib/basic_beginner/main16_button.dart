import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new Application()));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> {

  String ptext = 'Click me';
  void method1(){
    setState((){
      ptext ='you clicked raised button';
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
          child: new RaisedButton(onPressed: (){method1();},child: new Text(ptext),),
        )
    );
  }
}