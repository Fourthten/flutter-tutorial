import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

List<String> languages = ['en', 'id'];

Future<String> loadJsonFromAsset(language) async {
  return await rootBundle.loadString('assets/languages/' + language + '.json');
}

Map<String, String> convertValueToString(obj) {
  Map<String, String> result = {};
  obj.forEach((key, value) {
    result[key] = value.toString();
  });
  return result;
}

Future<Map<String, Map<String, String>>> initialize() async {
  Map<String, Map<String, String>> values = {};
  for (String language in languages) {
    Map<String, dynamic> translation =
        json.decode(await loadJsonFromAsset(language));
    values[language] = convertValueToString(translation);
  }
  return values;
}