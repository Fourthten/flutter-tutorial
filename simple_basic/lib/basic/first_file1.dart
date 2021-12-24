import 'dart:math';

import 'package:flutter/material.dart';

class FirstClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10.0,
          title: Center(child: Text('Title'),),
          actions: <Widget>[
            Icon(Icons.settings)
          ],
        ),
        body: Material(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.ac_unit), 
                title: Text('Dog'),
                subtitle: Text('This is an animal.'),
                trailing: Icon(Icons.access_time),
              ),
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('Cat'),
                subtitle: Text('This is an animal.'),
                trailing: Icon(Icons.access_time),
              ),
              Padding(
                child: Text('Dog'),
                padding: EdgeInsets.all(10.0)
              ),
              Container(
                child: Text('Cat'),
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                color: Colors.green,
                padding: EdgeInsets.only(top: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  String generateNumbers(){
    var r=Random();
    int i=r.nextInt(20);
    return 'A random number between 0 and 20 is ${i}';
  }
}