import 'package:flutter/material.dart';

void main() => runApp(new Application());

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> with SingleTickerProviderStateMixin {

  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
        title: "Application001",
        home: new Scaffold(
          appBar: new AppBar(title: new Text("Application001"),
            bottom: new TabBar(
              controller: controller,
              tabs:[
                new Tab(text: "TAB 1" ,),
                new Tab(text: "TAB 2",),
                new Tab(text: "TAB 3",),
              ]),
            backgroundColor: Colors.deepOrange,
          ),
          bottomNavigationBar: new Material(
            color: Colors.deepOrange,
            child: new TabBar(
              controller: controller,
              tabs:[
                new Tab(text: "TAB 1" ,),
                new Tab(text: "TAB 2",),
                new Tab(text: "TAB 3",),
              ]),
          ),
          body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new Center(child:new Text("Tab1 View 1") ,),
              new Center(child:new Text("Tab1 View 2") ,),
              new Center(child:new Text("Tab1 View 3") ,),
            ],
          ),
        )
    );
  }
}