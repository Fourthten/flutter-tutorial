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
    return new Container(
      color: Colors.pink,
      child: new Container(
        color: Colors.orange,
        margin: const EdgeInsets.all(15.0),
        child: new Container(
          color: Colors.green,
          margin: const EdgeInsets.all(15.0),
          child: new Container(
            color: Colors.blue,
            margin: const EdgeInsets.all(15.0),
            child: new Container(
              color: Colors.yellow,
              margin: const EdgeInsets.all(15.0),
              child: _methodcustom(),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _methodcustom() {
  return new Container(
    color: Colors.purple,
    margin: const EdgeInsets.all(15.0),
  );
}