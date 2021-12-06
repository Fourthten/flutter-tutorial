Buat proyek weather_app
Tambahkan di pubspec.yaml
```
dependencies:
  flutter:
    sdk: flutter
  provider: ^3.0.0
```
Import package provider `import 'package:provider/provider.dart';`\
WeatherModel berisi data city dan temperature. `screens\input.dart` menampilkan halaman input kota (buildInitialInput). 
`screens\weather.dart` menampilkan halaman data kota dan temperatur beserta input kota (buildColumnWithData). 
`Provider.of<WeatherModel>(context)` menjalankan method pada class WeatherModel. `Consumer<WeatherModel>` menampilkan data dari WeatherModel. 
Contoh file [weather_app](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-01/kasus/lib_weatherprovide)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-01/kasus/record/provideweather.gif" width="300">