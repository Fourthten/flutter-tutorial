import 'package:flutter/material.dart';

void main() {
  runApp(new Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Custom Widgets",
      home: new Scaffold(
        body: new customwidgets(),
      ),
    );
  }
}

class customwidgets extends StatelessWidget {
  @override
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
            ),
          ),
        ),
      ),
    );
  }
}