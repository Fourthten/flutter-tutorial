import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(home: new Application()));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> {

  SimpleDialog sd = new SimpleDialog();

  _printmethod(val){
    print(val);
  }

  void _method1(){
    sd = new SimpleDialog(
      title: new Text('Title'),
      children: <Widget>[
        new SimpleDialogOption(
          onPressed: () { Navigator.pop(context, _printmethod('d1')); },
          child: new Text('Treasury department'),
        ),
        new SimpleDialogOption(
          onPressed: () { Navigator.pop(context, _printmethod('d1')); },
          child: const Text('State department'),
        ),
      ],
    );
    showDialog(context: context, builder: (_) => sd);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
    body: new Center(
      child: new RaisedButton(onPressed: (){_method1();},child: new Text('Show Alert Dialog'),),
    ),
    );
  }
}