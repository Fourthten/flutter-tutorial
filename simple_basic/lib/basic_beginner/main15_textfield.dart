import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new Application()));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> {

  String ptext = '';

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
          children: <Widget>[
            new TextField(
                onChanged: (String tval) {
                  setState(() {
                    ptext = tval;
                  });
                }),
            new Text(ptext)
          ],
        )
    );
  }
}