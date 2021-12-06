// import package
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    // panggil widget AwesomeButton()
    home: new AwesomeButton(),
    debugShowCheckedModeBanner: false
  ));
}

// Widget AwesomeButton
class AwesomeButton extends StatefulWidget {
  @override
  AwesomeButtonState createState() => new AwesomeButtonState();
}

// state awesomebutton
class AwesomeButtonState extends State<AwesomeButton> {
  // constructor
  int counter = 0;
  List<String> strings = ["Flutter", "Is", "Awesome"];
  String displayedString = "";

  // variables juga bisa seperti ini
  // var counter = 0;
  // var strings = ["Flutter", "Is", "Awesome"];

  // onPressed function
  void onPressed(){
    // state merupakan data private komponen yang tidak bisa diakses komponen lain
    // ketika state berubah maka komponen akan di render atau rebuild
    setState(() {
      displayedString = strings[counter];
      counter = counter < 2 ? counter+1 : 0;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      // appBar style
      appBar: new AppBar(title: new Text("Stateful Widget!"), backgroundColor: Colors.deepOrange),
      // body app
      body: new Container(
        // child center
        child: new Center(
          // chiled vertical
          child: new Column(
            // posisi alignment center
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // text style
              new Text(displayedString, style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              // padding
              new Padding(padding: new EdgeInsets.all(15.0)),
              // raised button
              new RaisedButton(
                // text button style
                child: new Text("Press me!", style: new TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 20.0)),
                // color button
                color: Colors.red,
                // action onPressed function
                onPressed: onPressed
              )
            ]
          )
        )
      )
    );
  }
}
