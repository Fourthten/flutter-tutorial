import 'dart:math';

import 'package:flutter/material.dart';
class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.purple,
                      child: Text(
                        "Expanded",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    )
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.yellow,
                      child: Text(
                        "Flexible",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    )
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      color: Colors.yellow,
                      child: Text(
                        "Flexible",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    )
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.yellow,
                      child: Text(
                        "Flexible",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    )
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.purple,
                      child: Text(
                        "Expanded",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.red,
                      child: Text(
                        "Expanded",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    )
                  )
                ],
              )
            ],
          ),
      )
    );
  }

  String generateNumbers(){
    var r=Random();
    int i=r.nextInt(20);
    return 'A random number between 0 and 20 is ${i}';
  }
}