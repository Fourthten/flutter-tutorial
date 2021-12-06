### Imperatif Deklaratif
Flutter bersifat deklaratif yang membangun UI untuk mencerminkan kondisi aplikasi saat ini.\
Imperatif\
Pergi ke ViewB mengambil b dengan selector atau findViewById dan meminta mutasi padanya.
```
// Imperative style
b.setColor(red)
b.clearChildren()
ViewC c3 = new ViewC(...)
b.add(c3)
```
Deklaratif\
Konfigurasi tampilan widget tidak dapat diubah dan hanya blueprint. 
Untuk mengubah UI, widget memicu membangun kembali dengan sendirinya 
(panggil setState() di StatefulWidgets) dan membuat subtree widget baru.
```
// Declarative style
return ViewB(
  color: red,
  child: ViewC(...),
)
```
Ephemeral state untuk single widget, app state untuk banyak/beberapa widget.
## Simple provider
ChangeNotifier adalah kelas sederhana yang menyediakan notifikasi perubahan kepada listeners. 
Jika sesuatu seperti ChangeNotifier dapat subscribe untuk perubahannya. 
ChangeNotifier adalah salah satu cara merangkum state aplikasi. 
Panggil notifyListeners() saat model berubah yang dapat mengubah UI aplikasi.\
ChangeNotifierProvider adalah widget yang menyediakan turunan dari ChangeNotifier untuk turunannya. 
ChangeNotifierProvider tidak membangun kembali CartModel jika tidak benar-benar diperlukan. 
Dan secara otomatis memanggil dispose() pada CartModel ketika instance tidak diperlukan. 
Jika ingin memberi lebih dari satu kelas dapat menggunakan MultiProvider.\
Consumer widget membutuhkan builder. Builder adalah fungsi yang dipanggil setiap kali ChangeNotifier berubah. 
Builder dipanggil dengan tiga argument. Pertama Context, Kedua instance dari ChangeNotifier (menggunakan data model untuk tampilan UI), 
Ketiga child yang hanya perlu membangun sekali subtree widget besar di bawah consumer yang tidak berubah dan mendapatkannya melalui builder.\
Provider.of dimana tidak benar-benar membutuhkan data model untuk merubah UI tapi masih perlu untuk aksesnya.
```
Provider.of<CartModel>(context, listen: false).add(item);
```
Kode diatas tidak menyebabkan widget dibangun kembali ketika notifyListeners dipanggil.

### Provider Shopper
1. Buat proyek baru dengan nama `provider_shopper`
2. Tambahkan di pubspec.yaml
```
dependencies:
  flutter:
    sdk: flutter
  provider: ^3.0.0
```
import package provider `import 'package:provider/provider.dart';`\
3. Tambahkan font `Corben` di folder proyek, source: [Corben](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-01/latihan/fonts/Corben)\
4. Tambahkan common, models, screens, main.dart pada folder lib, source: [lib](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-01/latihan/lib_shopper)\
`common\theme.dart` digunakan untuk mengidentifikasi tema pada aplikasi.\
`screens` digunakan sebagai tampilan layar aplikasi. 
Dengan `Provider.of`, memiliki akses ke kelas model sebagai state saat ini.\
`models` berisi kelas model digunakan sebagai akses data pada aplikasi.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-01/latihan/record/shopper.gif" width="300">

### Provider Counter
1. Buat proyek baru dengan nama `provider_counter`
2. Tambahkan di pubspec.yaml
```
dependencies:
  flutter:
    sdk: flutter
  provider: ^3.0.0
```
import package provider `import 'package:provider/provider.dart';`\
3. Edit `lib\main.dart` source: [main.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-01/latihan/counter.dart)\
Gunakan `ChangeNotifierProvider` dengan builder `Counter`. Tampilan aplikasi menggunakan widget MyHomePage. 
`Consumer` untuk menampilkan data yang didapat. `Provider.of` untuk menjalakan method pada class Counter.\
![counter](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-01/latihan/images/counter.PNG)
### Business Logic Component
Buat proyek baru `bloc_update_tutorial`\
Tambahkan bloc library di pubspec.yaml. 
Equatable untuk menyederhanakan perbandingan nilai Dart,
```
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^0.15.1
  equatable: ^0.2.6
```
simple UI weather `lib\main.dart`. source: [simpleweather.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-01/latihan/simpleweather.dart)\
Menggunakan bloc:\
Klik kanan folder `lib`, pilih `Bloc: New Bloc`, beri nama `weather`, pilih `Yes`\
Kemudian copy source ini: [lib](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-01/latihan/lib_weather)\
File `bloc.dart` untuk mengekspor _bloc, _event, _state yang nantinya di import pada file `main.dart`. 
Model berisi kelas weather yang akan di import pada file `main.dart`. 
Widget MyApp memanggil widget WeatherPage sebagai home dari MaterialApp, yang memiliki State _WeatherPageState. 
Di build _WeatherPageState memiliki BlocProvider sebagai body. 
BlocProvider merupakan InheritedWidget yang dibuat khusus untuk meneruskan Blocs ke widget tree. 
Untuk mengatasi instance WeatherBloc(_WeatherPageState) dan TextField(CityInputField) yang terpisah. 
BlocProvider di dalamnya memiliki child Container untuk style tampilan yang berisi 
child BlocListener untuk mengeksekusi setiap perubahan dan mencetak perubahan(print). 
Di dalamnya berisi BlocBuilder untuk membangun kembali widget ketika state di pancarkan/kirim.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-01/latihan/record/weather.gif" width="300">

[State Management](https://flutter.dev/docs/development/data-and-backend/state-mgmt/intro)\
State itu merupakan kondisi-kondisi yang akan dialami oleh aplikasi yang kita buat ketika melakukan suatu pekerjaan.
Dimana data yang ada dapat didefinisikan dan dipusatkan pada sebuah file sehingga bisa digunakan oleh semua component yang ada agar dapat saling bertukar data dengan mengakses state yang telah didefinisikan.

Deklaratif Imperatif, [read1](https://flutter.dev/docs/get-started/flutter-for/declarative), 
[read2](https://medium.com/@masbe/pemrograman-declarative-vs-pemrograman-imperative-c41bb7e03112)\
[Ephemeral, App State](https://flutter.dev/docs/development/data-and-backend/state-mgmt/ephemeral-vs-app)\
Ephemeral - Bertahan selama beberapa detik seperti keadaan animasi saat ini atau satu halaman seperti peringkat produk saat ini. Flutter mendukungnya melalui StatefulWidget. 
[read](https://www.tutorialspoint.com/flutter/flutter_ephemeral_state_management.htm)\
App state - Terakhir untuk seluruh aplikasi seperti rincian pengguna yang masuk, informasi keranjang, dll., Flutter mendukungnya melalui scoped_model. [read](https://www.tutorialspoint.com/flutter/flutter_application_state.htm)\
[List SM](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options)

[Bloc](https://medium.com/learnfazz/bloc-pattern-pada-flutter-a13523af8484), seperti arsitektur. 
Provider adalah Widget yang akan memiliki data dan akan tersedia di mana saja di aplikasi Anda dengan BuildContext. Ini adalah tempat di mana Anda dapat «menyimpan» (misalnya informasi pengguna yang diautentikasi) dan mendapatkannya di Widget apa pun tanpa membuat panggilan API lain atau apa pun.
ChangeNotifier digunakan untuk memberi tahu View kami ketika satu atau lebih variabel berubah dalam ViewModel-nya. 
[raed1](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple), 
[read2](https://medium.com/@dafinrs/pragmatic-state-dan-provider-d24fd3bf746a).

Sumber:\
[Provider](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)\
[BLoC](https://resocoder.com/2019/06/12/bloc-library-updated-painless-state-management-for-flutter/)