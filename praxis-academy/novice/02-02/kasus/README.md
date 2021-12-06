### Stateless Widgets
```
// import package
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    // Menampilkan text 'Cool'
    // home: new Text("Cool"),
    // Panggil Widget MyStatelessWidget()
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
```
`void main()` menjalankan `MaterialApp` yang berisi widget `MyStatelessWidget`. 
`MyStatelessWidget` berisi appBar dan body aplikasi. Body berisi list widget `MyCard`. 
Widget `MyCard` berisi title dan icon.\
File [stateless_widget.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/kasus/stateless_widget.dart)\
![Stateless](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/kasus/images/stateless_widget.PNG)
### Button dan Stateful Widget
Stateful dan state terpisah dan berbeda,
```
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
    // state merupakan data private variabel yang tidak bisa diakses variabel lain
    // ketika state berubah maka variabel akan di render atau rebuild
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
```
`void main()` menjalankan `MaterialApp` yang berisi widget `AwesomeButton`. 
`AwesomeButton` berisi state class `AwesomeButtonState`. Di dalamnya terdiri dari constructor, function, Scaffold. 
Scaffold berisi appBar, body. Body memiliki raisedbutton yang apabila di press/klik menjalankan function onPressed() 
untuk mengubah value variabel dalam state tersebut. Kemudian value tersebut ditampilkan ke dalam body.\
File [statefull_widget.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/kasus/statefull_widget.dart)\
![statefull](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/kasus/images/statefull_widget.PNG)
### Basic Navigasi dan Routes
1. Simpel route menggunakan StatelessWidget
```
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
```
Pada Home Page apabila `onPress` *icon favorite* akan *route* ke Second Page. Jika klik tombol *back* pada Second Page akan kembali ke Home Page.\
File [route_stateless.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/kasus/route_stateless.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/kasus/record/routestateless.gif" width="300">

2. Route menggunakan StatefulWidget
```
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
```
Pada halaman MyHomePage menampilkan appbar, text, button `access_alarm` dan floating button `add`. 
button `access_alarm` apabila di onPress call `_onButtonPressed` menavigasi ke halaman MyItemsPage. 
floating button `add` apabila di onPress call `_incrementCounter` menavigasi ke halaman MyItemsPage. 
Pada halaman MyItemsPage menampilkan appbar, text, button `arrow_back` dan floating button `add`. 
button `arrow_back` apabila di onPress call `_onButtonPressed` menavigasi ke halaman sebelumnya. 
floating button `add` apabila di onPress hanya call `_onFloatingActionButtonPressed` tanpa ada perintah berikutnya.\
File [route_stateful.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/kasus/route_stateful.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-02/kasus/record/routestateful.gif" width="300">

Sumber:
[Flutter Tutorials Handbook](https://kodestat.gitbook.io/flutter/)