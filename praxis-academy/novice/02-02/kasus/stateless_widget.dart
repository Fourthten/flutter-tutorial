import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    // Menampilkan text 'Cool'
    // home: new Text("Cool"),
    // Panggil MyStatelessWidget() Widget
    home: new MyStatelessWidget(),
    debugShowCheckedModeBanner: false,
  ));
}

// Widget MyStatelessWidget
class MyStatelessWidget extends StatelessWidget {
  @override
  // BuildContext mengidentifikasi dimana widget dibangun
  Widget build(BuildContext context){
    //Scaffold menyediakan fungsionalitas appbar, body, dll
    return new Scaffold(
      // appBar
      appBar: new AppBar(title: new Text("Stateless Widget")),
      // body aplikasi
      body: new Container(
        // padding sekitar card di dalam container
        padding: new EdgeInsets.all(20.0),
        // child berisi single widget
        child: new Column(
          // posisi alignment dilebarkan
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // children berisi list widget
          children: <Widget>[
            // simple list card
            // new Text("Hey"),
            // new Text("My name"),
            // new Text("Is Raunak")

            // list card
            new MyCard(
              // title style
              title: new Text("I love Flutter", style: new TextStyle(fontSize: 20.0)),
              // icon style
              icon: new Icon(Icons.favorite, size: 40.0, color: Colors.redAccent)
            ),
            new MyCard(
              title: new Text("I love Donuts", style: new TextStyle(fontSize: 20.0)),
              icon: new Icon(Icons.donut_large, size: 40.0, color: Colors.brown)
            ),
            new MyCard(
              title: new Text("I see you", style: new TextStyle(fontSize: 20.0)),
              icon: new Icon(Icons.visibility, size: 40.0, color: Colors.blue)
            )
          ]
        )
      )
    );
  }
}

// Widget MyCard
class MyCard extends StatelessWidget {
  // constructor
  MyCard({this.title, this.icon});

  final Widget title;
  final Widget icon;

  @override
  Widget build(BuildContext context){
    return new Container(
      // bottom padding card
      padding: new EdgeInsets.only(bottom: 20.0),
      child: new Card(
        child: new Container(
          // padding di dalam card
          padding: new EdgeInsets.all(15.0),
          child: new Column(
          children: <Widget>[
              // simple isi card
              // new Text("I love Flutter"),
              // new Icon(Icons.favorite)
              
              // get title dan icon
              this.title,
              this.icon
            ]
          )
        )
      )
    );
  }
}