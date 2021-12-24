import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new Application()));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> {

  int  radiovalue = 0;
  void method4(val){
    setState((){
      radiovalue = val;
      print('$radiovalue');
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
          children: <Widget>[
            new Radio(value: 1, groupValue: radiovalue,  onChanged:(int? change){method4(change);},),
            new Radio(value: 2, groupValue: radiovalue,  onChanged:(int? change){method4(change);},),
            new Radio(value: 3, groupValue: radiovalue,  onChanged:(int? change){method4(change);},),
          ],
        )
    );
  }
}