import 'package:flutter/material.dart';
import 'dart:math';

class WeatherModel extends ChangeNotifier {
  String cityName;
  double temperature;

  getCity() => cityName;
  getTemperature() => temperature;

  setWeather(String _cityName){
    cityName = _cityName;
    temperature= 20 + Random().nextInt(15) + Random().nextDouble();
    notifyListeners();
  }
}