[DevTools](https://flutter.dev/docs/development/tools/devtools), serangkaian alat kinerja dan profil yang berjalan di browser. 
Install DevTools terlebih dahulu jalankan , di terminal `flutter pub global activate devtools` 
atau dengan VS Code `View>Command Palette>Dart: Open DevTools>Activate Dart DevTools` dengan terlebih dahulu menjalankan aplikasi (f5). 
DevTools hanya support pada browser Google Chrome. Pilih tab [Flutter Inspector](https://flutter.dev/docs/development/tools/devtools/inspector) 
pada DevTools untuk membuka inspektur aplikasi. Pada IDE berjalan secara default apabila menggunakan terminal gunakan `flutter run --track-widget-creation` 
sehingga flutter inspector dapat menyajikan widget tree dalam cara yang sama bagaimana UI didefinisikan dalam kode. Buka DevTools di browser dengan `http://localhost:9100` 
lalu masukkan port url aplikasinya misal `http://127.0.0.1:56440/ucN44DE3X-w=/`

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/04-03/latihan/images/devtools.PNG" width="600">

Di gambar menggunakan aplikasi flutter [Internasionalisasi pendekatan JSON app](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-05/latihan)\
Select widget mode untuk menampilkan detail tree; Performance overlay berisi grafik GPU dan CPU; Paint Baselines untuk render text garis dasar; Debug Paint untuk render display border, padding, alignment, and spacer; 
logging untuk debug log; Slow Animations untuk inspeksi visual dengan memperlambat animasi; Repaint Rainbow menampilkan rotasi warna pada layar ketika di warna ulang.\
Mengukur waktu startup aplikasi dengan `flutter run --trace-startup --profile`, profile mode tidak bisa dijalankan pada emulator dan simulator karena performa tidak real. 
Hasil trace disimpan pada file `start_up_info.json` di dalam folder build.
```
{
  "engineEnterTimestampMicros": 490472173216, // waktu memasukkan kode mesin Flutter
  "timeToFrameworkInitMicros": 290277, // waktu inisialisasi framework flutter
  "timeToFirstFrameRasterizedMicros": 911105, // waktu rasterisasi frame pertama dari aplikasi
  "timeToFirstFrameMicros": 656220, // waktu merender frame pertama dari aplikasi
  "timeAfterFrameworkInitMicros": 365943 // waktu inisialisasi framework flutter selesai
}
```
Tracing ditampilkan secara timeline view. UI mengeksekusi kode Dart di Dart VM. GPU mengeksekusi kode grafis dari Flutter Engine.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/04-03/latihan/images/timeline.PNG" width="600">

Jika di Android Studio `run>debug`. `java>io.flutter.plugins>GeneratedProjectRegistrant` untuk membuka kode Java di edit pane. 
`Attach debugger to Android process` untuk menjalankan di perangkat. lihat pada tab debugger,\
Build mode terdiri dari Debug mode, aplikasi diatur untuk debugging pada physical device, emulator, simulator. 
Release mode, untuk menggunakan aplikasi saat menginginkan optimalisasi maksimum dan ukuran footprint minimal. 
Profile mode, beberapa kemampuan debugging cukup untuk profil kinerja aplikasi.\
Testing aplikasi flutter dengan [Unit test](https://flutter.dev/docs/cookbook/testing/unit/introduction) untuk tes single function, method atau class. 
[Widget test](https://flutter.dev/docs/testing#widget-tests) untuk tes single widget. [Integration test](https://flutter.dev/docs/testing#integration-tests) untuk tes aplikasi lengkap atau hanya sebagian besar.
### Unit Test
Tes unit berguna untuk memverifikasi perilaku single function, method, atau class. 
Unit test menyediakan framework inti untuk menulis unit test, dan 
paket flutter_test menyediakan utilitas tambahan untuk menguji widget.\
buat projek, tambahkan dependencies
```
dev_dependencies:
  test: ^1.6.3
```
buat file, [unit test](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-03/latihan/unittest)
```
counter_app/
  lib/
    counter.dart
  test/
    counter_test.dart
```
klik F5 di vscode pada counter_test.dart
```
✓ Counter value should start at 0
✓ Counter value should be incremented
✓ Counter value should be decremented
```
jalankan `flutter test test/counter_test.dart` di terminal
```
00:07 +3: All tests passed!
```
### Widget Test
WidgetTester memungkinkan pembuatan dan interaksi dengan widget. 
testWidgets() membuat WidgetTester baru untuk setiap kasus uji dan sebagai pengganti fungsi tes normal. 
Finder memungkinkan pencarian widget. 
Konstanta Widget-specific Matcher membantu memverifikasi apakah Finder menemukan widget.\
jalankan [widget_test](https://github.com/Fourthten/praxis-academy/blob/master/novice/04-03/latihan/widgettest.dart) `flutter test lib/main.dart`
```
00:04 +1: All tests passed!
```
### Integration Test
bekerja secara berpasangan unit dan widget test. 
pertama, gunakan aplikasi yang diinstrumentasi ke perangkat kemudian "drive" aplikasi dari test suite yang terpisah, 
memeriksa untuk memastikan semuanya benar di sepanjang jalan.\
tambahkan dependencies
```
dev_dependencies:
  flutter_driver:
    sdk: flutter
  test: ^1.6.3
```
Buat file [integration_test](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-03/latihan/integrationtest)
```
counter_app/
  lib/
    main.dart
  test_driver/
    app.dart
    app_test.dart
```
Jalankan di terminal `flutter drive --target=test_driver/app.dart`
```
00:00 +0: Counter App (setUpAll)
00:05 +0: Counter App starts at 0
00:05 +1: Counter App increments the counter
00:06 +2: Counter App (tearDownAll)
00:06 +2: All tests passed!
```
### Logging
Bisa dengan stdout dan stderr
```
stderr.writeln('print me');
```
Atau dengan dart:developer log()
```
import 'dart:convert';
import 'dart:developer' as developer;
void main() {
  var myCustomObject = ...;
  developer.log(
    'log me',
    name: 'my.app.category',
    error: jsonEncode(myCustomObject),
  );
  developer.log('log me', name: 'my.app.category');
}
```
Setting breakpoints dengan debugger
```
import 'dart:developer';
void someFunction(double offset) {
  debugger(when: offset > 30.0);
}
```
Debug flag memunculkan widget tree menggunakan debugDumpApp(), debugDumpRenderTree(), debugDumpLayerTree(), debugDumpSemanticsTree(), dll.
```
onPressed: () {
  debugDumpApp();
},
```

Sumber:\
[Debugging Flutter apps](https://flutter.dev/docs/testing/debugging)\
[Debugging Flutter apps programmatically](https://flutter.dev/docs/testing/code-debugging)\
[Build Mode](https://flutter.dev/docs/testing/build-modes)\
[Testing Flutter](https://flutter.dev/docs/testing)\
[VS Code Debug](https://dartcode.org/docs/debugging-commands/)\
[VS Code Log](https://dartcode.org/docs/logging/)\
[Android Studio Debug](https://flutter.dev/docs/testing/oem-debuggers)