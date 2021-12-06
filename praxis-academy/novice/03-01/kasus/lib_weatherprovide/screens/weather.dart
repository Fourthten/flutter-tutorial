import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/input.dart';
import 'package:weather_app/models/weather.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({Key key}) : super(key: key);

  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Weather App"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Consumer<WeatherModel>(
          builder: (context, weather, child){
            if(weather.getCity()==null){
              return buildInitialInput();
            } else {
              return buildColumnWithData();
            }
          },
        )
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Column buildColumnWithData() {
    final weather = Provider.of<WeatherModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.getCity(),
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.getTemperature().toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }
}