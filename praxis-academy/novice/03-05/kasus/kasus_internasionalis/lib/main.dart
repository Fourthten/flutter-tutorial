import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:myapp/initialize.dart' show initialize;
import 'package:myapp/localization.dart' show MyLocalizations, MyLocalizationsDelegate;

List<String> languages = ['en', 'id'];


void main() async {
  Map<String, Map<String, String>> localizedValues = await initialize();
  runApp(MyApp(localizedValues));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> localizedValues;
  MyApp(this.localizedValues);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String _locale = 'en';
  onChangeLanguage() {
    if (_locale == 'en') {
      setState(() {
        _locale = 'id';
      });
    } else {
      setState(() {
        _locale = 'en';
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
      locale: Locale(_locale),
      localizationsDelegates: [
        MyLocalizationsDelegate(widget.localizedValues),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: languages.map((language) => Locale(language, '')),
      // Scaffold struktur
      home: AppBody(this.onChangeLanguage)
    );
  }
}

class AppBody extends StatelessWidget {
  final VoidCallback onChangeLanguage;
  AppBody(this.onChangeLanguage);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(MyLocalizations.of(context).hello),
        ),
        body: new Center(
          child: new Text(MyLocalizations.of(context).header),
        ),
        floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.language), onPressed: onChangeLanguage));
  }
}