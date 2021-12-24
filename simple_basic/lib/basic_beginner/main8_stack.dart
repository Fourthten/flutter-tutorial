import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new Application()));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> {
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Card(color: Colors.pink,child:new Padding(padding: const EdgeInsets.all(200.0),)),
            new Card(color: Colors.green,child:new Padding(padding: const EdgeInsets.all(100.0),)),
            new Card(color: Colors.blue,child:new Padding(padding: const EdgeInsets.all(50.0),)),
            new Card(color: Colors.yellow,child:new Padding(padding: const EdgeInsets.all(10.0),)),
          ],
        )
    );
  }
}