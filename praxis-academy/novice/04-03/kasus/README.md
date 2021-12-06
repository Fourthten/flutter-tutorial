### Profiling kinerja aplikasi
Koneksi physical device, Jalankan dengan mode profil `flutter run --track-widget-creation --trace-startup --profile` di terminal. 
Mode profil tidak bisa dijalankan di emulator dan simulator. Jalankan DevTools di terminal `flutter pub global run devtools`. 
Buka DevTools di browser Google Chrome dengan `http://localhost:9100` lalu masukkan port url aplikasinya. 
Testing ini menggunakan aplikasi [Internasionalisasi pendekatan JSON app](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-05/latihan). 
UI mengeksekusi kode Dart di Dart VM. GPU mengeksekusi kode grafis dari Flutter Engine. Jika frame merender di bawah 16ms maka tidak perlu khawatir dengan performa.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/04-03/kasus/images/before.png" width="300">

Untuk meningkatkan performa, sebagai contoh mengubah stateless widget menjadi stateful widget. tambahkan label dan atur contrast pada floatingActionButton sebagai saran aksesibilitas scanner.
```
class AppBody extends StatefulWidget {
  final VoidCallback onChangeLanguage;
  AppBody(this.onChangeLanguage);
  @override
  _AppBodyState createState() => _AppBodyState();
}
class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(MyLocalizations.of(context).hello),
      ),
      body: new Center(
        child: new Text(MyLocalizations.of(context).greetTo('Agung')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Language'),
        icon: Icon(Icons.language),
        backgroundColor: Colors.green[100],
        foregroundColor: Colors.black,
        onPressed: widget.onChangeLanguage
      )
    );
  }
}
```

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/04-03/kasus/images/afters.png" width="300">

Sumber:\
[Profiling](https://flutter.dev/docs/perf/rendering/ui-performance)\
[Performance best practices](https://flutter.dev/docs/perf/rendering/best-practices)