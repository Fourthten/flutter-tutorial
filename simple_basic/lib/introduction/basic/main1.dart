import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "My Flutter App",
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text('Title'),
        ),
        body: Center(
          child: Text('This is a text.', textDirection: TextDirection.ltr,),
        ),
      ),
    )
  );
}