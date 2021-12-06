import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complex_firestore/Pages/ItemOne.dart';
import 'package:complex_firestore/Pages/ItemTwo.dart';
import 'package:complex_firestore/Pages/ItemThree.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  int _indexpage = 0;

  final pageOptions = [
    ItemOne(),
    ItemTwo(),
    ItemThree()
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Complex App'),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Complex App",
                style: TextStyle(
                  fontSize: 20.0
                ),
              ), 
              accountEmail: null,
              decoration: BoxDecoration(
                color: Colors.deepOrange
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (c)=>ItemOne()
                  )
                );
              },
              title: Text("First Item",
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black
                ),
              ),
              leading: Icon(Icons.more, color: Colors.black,),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (c)=>ItemTwo()
                  )
                );
              },
              title: Text("Home Item",
              style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black
                ),
              ),
              leading: Icon(Icons.home, color: Colors.black),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (c)=>ItemThree()
                  )
                );
              },
              title: Text("Third Item",
              style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black
                ),
              ),
              leading: Icon(Icons.photo, color: Colors.black),
            )
          ],
        ),
      ),
      body: pageOptions[_indexpage],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.deepOrange,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.green,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        index: 1,
        items: <Widget>[
          Icon(Icons.poll, size: 30.0, color: Colors.white),
          Icon(Icons.home, size: 30.0, color: Colors.white),
          Icon(Icons.comment, size: 30.0, color: Colors.white)
        ],
        onTap: (int index){
          setState(() {
            _indexpage=index;
          });
        },
      ),
    );
  }
}