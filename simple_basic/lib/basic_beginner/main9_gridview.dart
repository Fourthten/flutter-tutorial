import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new Application()));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> {

  List<int> _items = List.of(new List.empty());

  @override
  void initState() {
    for(int i=0;i<50;i++){
      _items.add(i);
      print(i);
    }
    print(_items);
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,),
        itemCount: _items.length,
        itemBuilder: (BuildContext context,int index){
          return cards(index);
        }
      )
    );
  }
}

Widget cards(val){
  return new Card(
    color: Colors.pink,
    child:new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Text('$val'),
    ),);
}