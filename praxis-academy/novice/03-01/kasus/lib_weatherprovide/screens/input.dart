import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';

class CityInputField extends StatefulWidget {
  const CityInputField({Key key,}) : super(key: key);

  @override
  _CityInputFieldState createState() => _CityInputFieldState();
}

class _CityInputFieldState extends State<CityInputField> {
  TextEditingController cityController = new TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: cityController,
        onSubmitted: submitCityName,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  submitCityName(String cityName) {
    // print('city= $cityName');
    // print(cityController.text);
    Provider.of<WeatherModel>(context, listen: false).setWeather(cityName);
  }
}