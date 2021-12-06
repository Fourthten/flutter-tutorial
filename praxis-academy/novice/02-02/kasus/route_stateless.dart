// import package
import 'package:flutter/material.dart';

void main() {
  // run app
  runApp(
  new MaterialApp(
    // call homePage
    home: new HomePage(),
    // route halaman kedua
    routes: <String, WidgetBuilder>{
      "/SecondPage": (BuildContext context) => new SecondPage()
    },
    debugShowCheckedModeBanner: false,
  ));
}

// Widget HomePage
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    // Scaffold
    return new Scaffold(
      // style appBar
      appBar: new AppBar(title: new Text("Home Page"), backgroundColor: Colors.deepOrange),
      // body
      body: new Container(
        child: new Center(
          child: new Column(
            // alignment
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Icon dan Text
              new IconButton(
                icon: new Icon(Icons.favorite, color: Colors.redAccent),
                iconSize: 70.0,
                // onPress route ke halaman kedua
                onPressed: () {Navigator.of(context).pushNamed("/SecondPage");}
              ),
              new Text("Home")
            ]
          )
        )
      )
    );
  }
}

// Widget SecondPage
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      // style appBar
      appBar: new AppBar(title: new Text("Second Page"), backgroundColor: Colors.deepOrange),
      // body
      body: new Container(
        child: new Center(
          child: new Column(
            // alignment
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Icon dan text
              new IconButton(
                icon: new Icon(Icons.home, color: Colors.blue),
                iconSize: 70.0,
                // OnPress null
                onPressed: null,
              ),
              new Text("Second Page")
            ]
          )
        )
      )
    );
  }
}
