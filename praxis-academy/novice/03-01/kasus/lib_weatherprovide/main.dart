import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/weather.dart';
import 'package:weather_app/models/weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeatherModel>(
      builder: (_) => WeatherModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WeatherPage(),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}