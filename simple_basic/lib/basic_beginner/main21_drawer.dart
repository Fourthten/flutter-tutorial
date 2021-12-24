import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new Application()));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> {

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Drawer'),),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Setia'),
              accountEmail: new Text('setia@mail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.black26,
                child: new Text('S'),
              ),
              decoration: new BoxDecoration(color: Colors.orange),
            ),
            new ListTile(
              title: new Text('Page 1'),
              trailing: new Icon(Icons.arrow_forward),
            ),
            new ListTile(
              title: new Text('Page 2'),
              trailing: new Icon(Icons.arrow_forward),
            ),
            new ListTile(
              title: new Text('Close'),
              trailing: new Icon(Icons.close),
              onTap: (){Navigator.pop(context);},
            ),
          ],
        )
      ),
    );
  }
}