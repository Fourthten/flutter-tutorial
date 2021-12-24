import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'global.dart';
import 'weatherApi.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Weather'),
    );
  }  
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key, 
    required this.title
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();  
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherApi? weatherApi;

  fetchPosts() async {
    var response = await http.get(Uri.parse(EARTHQUAKE_URL),headers: {"Content-Type":"application/json"});
    if(response.statusCode==200){
      print(response.body);
      final data=json.decode(response.body);
      weatherApi=WeatherApi.fromJson(data);
      return weatherApi;
    } else {
      // print("error");
      return "Sorry for inconvenience, Server under maintenence";
    }
  }

  List<Color> colors=[Colors.yellow, Colors.green, Colors.blue, Colors.orange, Colors.red];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchPosts(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data==null){
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if(snapshot.data != null){
              if(snapshot.data=="Sorry for inconvenience, Server under maintenence"){
                return Container(
                  child: Center(
                    child: Text(snapshot.data),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: weatherApi?.features.length,
                  itemBuilder: (BuildContext context, int index) {
                    List<String> places=weatherApi!.features[index].properties!.place!.split(',');
                    print(places);
                    return Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0xFFE0E0E0),
                            offset: Offset(0.5, 0.5),
                            blurRadius: 10.0,
                          )
                        ],
                        shape: BoxShape.rectangle,
                        color: Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width/6,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Colors.red
                                color: colors[(weatherApi!.features[index].properties?.mag)!.ceil()>4?4
                                  :(weatherApi!.features[index].properties?.mag)!.ceil()==0?0
                                  :(weatherApi!.features[index].properties?.mag)!.ceil()-1]
                              ),
                              child: Container(
                                margin: EdgeInsets.only(left:MediaQuery.of(context).size.width/19),
                                child: Text(
                                  // "1", 
                                  (weatherApi!.features[index].properties?.mag)!.ceil().toString(),
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  // "Banglore", 
                                  places[places.length-1].trim(),
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                Text(
                                  // "15 KM from Banglore", 
                                  places[0],
                                  style: TextStyle(fontSize: 12),)
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                );
              }
            };
            return const SizedBox();
          },
        ) 
      ),
    );
  }
}