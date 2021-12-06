### JSON (Javascript Object Notation)
Decode
```
List decodedList = JSON.decode('["Flutter", true]');
// decodedList[0] == 'Flutter'
// decodedList[1] == true
Map decodedMap = JSON.decode('{"framework":"Flutter", "awesome":true}');
// decodedMap['framework'] == 'Flutter'
// decodedMap['awesome'] == true
```
Encode
```
var data = JSON.encode({
    'framework': "Flutter",
    'tags': ['flutter', 'snippets'],
    'versions': '0.0.20',
    'task': 13511,
});
// data == '{"framework":"Flutter","tags":["flutter","snippets"],"versions":"0.0.20","task":13511}'
```
Tambahkan dependencies `http: ^0.12.0+2`\
Buat permintaan network
```
Future<http.Response> fetchPhotos(http.Client client) async {
  return client.get('https://jsonplaceholder.typicode.com/photos');
}
```
Parse dan convert JSON kedalam list photo\
Buat class photo
```
class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;

  Photo({this.id, this.title, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
```
Convert response kedalam list photo\
1. Buat `parsePhotos()` untuk convert response body kedalam `List<Photo>`.
2. Gunakan `parsePhotos()` di `fetchPhotos()`.
```
List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');

  return parsePhotos(response.body);
}
```
Memindahkan parse dan convert ke background isolate(isolate terpisah). 
Untuk mengatasi device lambat yang freeze saat parse dan convert json dengan `compute()`. 
Fungsi `compute()` menjalankan fungsi-fungsi mahal dalam background isolate dan mengembalikan hasilnya. 
```
Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');
  return compute(parsePhotos, response.body);
}
```
File [photojson.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-02/latihan/photojson.dart)\
![photo](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-02/latihan/images/photojson.PNG)

Serialisasi adalah proses mengubah objek menjadi JSON. Sedangkan deserialisasi adalah proses mengubah JSON menjadi objek. 
[read1](https://flutter.dev/docs/development/data-and-backend/json), 
[read2](https://flutter.institute/simple-json-with-flutter/), 
[read3](https://pub.dev/packages/json_serializable#-example-tab-)

Sumber:\
[Parse JSON in the background](https://flutter.dev/docs/cookbook/networking/background-parsing)