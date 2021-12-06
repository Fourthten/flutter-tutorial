// import package
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView",
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;
  List<int> todoItems = [];

  // 
  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json"
      }
    );

    // decode json
    this.setState(() {
      data = json.decode(response.body);
    });
    
    return "Success!";
  }

  @override
  void initState(){
    super.initState();
    // call getData
    this.getData();
  }

  void alertTodoItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Add "${data[index]["title"]}" ?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop()
            ),
            new FlatButton(
              child: new Text('ADD'),
              onPressed: () {
                addItem(index);
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
    );
  }

  addItem(int index){
    if(!todoItems.contains(index)){
      todoItems.add(index);
    }
    setState(() {
      todoItems.sort((a,b) => a.compareTo(b));
    });
    print(todoItems);
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      // style appBar
      appBar: new AppBar(
        title: new Text("List Views"), 
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListPage(todoItems: todoItems)
              )
            ),
          ),
        ],
      ),
      // body listview
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          if(!todoItems.contains(index)){
            return new Card(
              child: InkWell(
                onTap: () => alertTodoItem(index),
                child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    data[index]["title"],
                    style: new TextStyle(fontSize: 14.0),
                  ),
                )
              )
            );
          }
          return Container();
        },
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  final List todoItems;

  ListPage({Key key, @required this.todoItems}) : super(key: key);

  @override
  ListPageState createState() => new ListPageState();
}

class ListPageState extends State<ListPage> {
  List data, list, nowlist;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json"
      }
    );

    // decode json
    this.setState(() {
      data = json.decode(response.body);
    });
    
    return "Success!";
  }

  @override
  void initState(){
    super.initState();
    this.getData();
  }

  void alertTodoItem(int index, List item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Remove "${data[index]["title"]}" ?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop()
            ),
            new FlatButton(
              child: new Text('REMOVE'),
              onPressed: () {
                removeItem(index, item);
                Navigator.of(context).pop('String');
              }
            )
          ]
        );
      }
    );
  }

  removeItem(int index, List item){
    setState(() {
      list = item;
      list.removeWhere((item) => item == index);
    });
    print(list);
  }

  @override
  Widget build(BuildContext context){
    nowlist = widget.todoItems;
    list = nowlist==[]?list:nowlist;
    nowlist = [];
    return new Scaffold(
      // style appBar
      appBar: new AppBar(title: new Text("List Added"), backgroundColor: Colors.red),
      // body listview
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          if(list.contains(index)){
            return new Card(
              child: InkWell(
                onTap: () => alertTodoItem(index, widget.todoItems),
                child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    data[index]["title"],
                    style: new TextStyle(fontSize: 14.0),
                  ),
                )
              )
            );
          }
          return Container();
        },
      ),
    );
  }
}
