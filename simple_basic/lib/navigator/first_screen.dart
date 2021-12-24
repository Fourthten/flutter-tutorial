import 'dart:math';

import 'package:flutter/material.dart';

class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10.0,
          title: Center(child: Text('Screen 1'),),
          actions: <Widget>[
            Icon(Icons.settings)
          ],
        ),
        body: Material(
          child: WillPopScope(
              onWillPop: () async {
                return (await showDialog(
                  context: context, 
                  builder: (_) => AlertDialog(
                    title: Text('Are you sure?'),
                    content: Text('It will close the application.'),
                  )
                )) ?? false;
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
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
                  ),
                  GestureDetector(
                    child: Text('Click me'),
                    onTap: (){
                      Navigator.of(context).pushNamed('/screen2');
                    },
                  )
                ],
              ),
          )
        ),
    );
  }

  String generateNumbers(){
    var r=Random();
    int i=r.nextInt(20);
    return 'A random number between 0 and 20 is ${i}';
  }
}