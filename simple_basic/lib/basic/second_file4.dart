import 'dart:math';

import 'package:flutter/material.dart';
import 'util.dart';

class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.ac_unit),
              Container(
                height: 500.0,
                width: 300.0,
                color: lightPurpleColor,
                child: Text(generateNumbers(), textDirection: TextDirection.ltr,)
              ),
              Container(
                height: 500.0,
                width: 100.0,
                color: Colors.green,
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