import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new Application()));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> {

  bool swvalue = false;
  void method2(val){
    setState((){
      swvalue = val;
      print('$swvalue');
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
         child: new Switch(value: swvalue, onChanged: (bool swbool){method2(swbool);},),
        )
    );
  }
}