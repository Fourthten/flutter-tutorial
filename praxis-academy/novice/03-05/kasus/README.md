### Internasionalisasi
Membuat aplikasi multilingual bahasa indonesia dan inggris. 
Aplikasi pada materi [Memulai flutter pada android device / emulator](https://github.com/Fourthten/praxis-academy/tree/master/novice/02-01/kasus) di ubah menjadi multilingual.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-05/kasus/record/internasionalisapp.gif" width="300">

[Kode sumber](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-05/kasus/kasus_internasionalis)\
Buat file json seperti di kode sumber yang berisi data bahasa dan letakkan di `assets\languages`. Konfigurasi file pubspec.yaml
```
assets:
    - assets/languages/id.json
    - assets/languages/en.json
```
Tambahkan flutter_localizations
```
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```
Widget MyApp dengan MyAppState memiliki widget AppBody yang berisi tampilan aplikasi. 
Method `onChangeLanguage` untuk mengubah bahasa aplikasi. 
Method `initialize()` memiliki `loadJsonFromAsset()` dan `convertValueToString()` untuk mendeklarasi bahasa dari file json. 
MyLocalizationsDelegate sebagai inheritance dari MyLocalizations yang menginisialisasi localizedValues. 
`MyLocalizations.of(context)` untuk mendapatkan data bahasa dan mengubahnya pada tampilan.