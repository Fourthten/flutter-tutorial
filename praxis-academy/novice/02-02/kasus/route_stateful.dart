// import package
import 'package:flutter/material.dart';

// runapp
void main() => runApp(new MyApp());

// Widget MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // variabel
    var routes = <String, WidgetBuilder>{
      MyItemsPage.routeName: (BuildContext context) => new MyItemsPage(title: "MyItemsPage"),
    };
    return new MaterialApp(
      title: 'Flutter Demo',
      // tema app
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      // call MyHomePage
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      // route MyItemsPage
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

// Widget MyHomePage
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  // State MyHomePage
  _MyHomePageState createState() => new _MyHomePageState();
}

// State _MyHomePageState
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // route ke MyItemsPage
  void _incrementCounter() {
    Navigator.pushNamed(context, MyItemsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    // button call _onButtonPressed
    var button = new IconButton(icon: new Icon(Icons.access_alarm), onPressed: _onButtonPressed);
    return new Scaffold(
      // appbar
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      // body
      body: new Column(
        children: <Widget>[
          // text dan button
          new Text('Dog'),
          new Text('Cat'),
          button
        ],
      ),
      // floatingActionButton call _incrementCounter
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

  // route ke MyItemsPage
  void _onButtonPressed() {
    Navigator.pushNamed(context, MyItemsPage.routeName);
  }
}

// Widget MyItemsPage
class MyItemsPage extends StatefulWidget {
  MyItemsPage({Key key, this.title}) : super(key: key);
  // contructor

  static const String routeName = "/MyItemsPage";

  final String title;

  @override
  // State MyItemsPage
  _MyItemsPageState createState() => new _MyItemsPageState();
}

// 1. Setelah halaman dibuat, registrasi dengan routes app
// routes: <String, WidgetBuilder>{
//   MyItemsPage.routeName: (BuildContext context) => new MyItemsPage(title: "MyItemsPage"),
// },

// 2. Bisa juga menggunakAan navigasi ke halaman.
// Navigator.pushNamed(context, MyItemsPage.routeName);

// State _MyItemsPageState
class _MyItemsPageState extends State<MyItemsPage> {
  @override
  Widget build(BuildContext context) {
    // button call _onButtonPressed
    var button = new IconButton(icon: new Icon(Icons.arrow_back), onPressed: _onButtonPressed);
    return new Scaffold(
      // appBar
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      // body
      body: new Container(
        child: new Column(
          children: <Widget>[
            // Text dan button
            new Text('Item1'),
            new Text('Item2'),
            button
          ],
        ),
      ),
      // floatingActionButton call _onFloatingActionButtonPressed
      floatingActionButton: new FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        tooltip: 'Add',
        child: new Icon(Icons.add),
      ),
    );
  }

  // null function
  void _onFloatingActionButtonPressed() {
  }

  // navigasi go back
  void _onButtonPressed() {
    Navigator.pop(context);
  }
}
