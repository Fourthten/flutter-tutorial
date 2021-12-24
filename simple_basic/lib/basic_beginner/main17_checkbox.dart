import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new Application()));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> {

  bool checkvalue = false;
  void method3(val){
    setState((){
      checkvalue = val;
      print('$checkvalue');
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
         child: new Checkbox(value: checkvalue,  onChanged: (bool? checkbool){method3(checkbool);},),
        )
    );
  }
}