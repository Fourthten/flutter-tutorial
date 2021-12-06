import 'package:flutter/material.dart';
import 'package:flavorsexample/display_strings.dart';
import 'package:intl/intl.dart';
 
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
 
  @override
  _HomePageState createState() => _HomePageState();
 
}
 
class _HomePageState extends State<HomePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flavors Example"),
      ),
      body: _buildBody(),
    );
  }
 
  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Text(APP_TITLE),
          Text(DATE + getDateForDisplay()),
          Text(APP_DESCRIPTION),
          Image.asset('assets/dancing.png', width: 50.0, height: 50.0,),
          Image.asset('assets/1.png', width: 50.0, height: 50.0),
        ],
      )
    );
  }
 
  String getDateForDisplay() {
    DateTime now = DateTime.now();
    var formatter = DateFormat('EEEE dd MMMM yyyy');
    return formatter.format(now);
  }
 
}