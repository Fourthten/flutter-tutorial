import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(home: new Application()));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  void _method1(){
    _scaffoldkey.currentState?.showSnackBar(new SnackBar(content: new Text('Activated Snackbar')));
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldkey,
      body: new Center(
        child: new RaisedButton(onPressed: (){_method1();},child: new Text('Activate Snackbar'),),
      ),
    );
  }
}