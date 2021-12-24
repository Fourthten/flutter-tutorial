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
      appBar: new AppBar(
        title: new Text('Appbar'),
        backgroundColor: Colors.green,
        elevation: 30.0,
        centerTitle: true,
        titleSpacing: 70.0,
        toolbarOpacity: 0.5,
      ),
    );
  }
}