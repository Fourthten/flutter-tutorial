### Internasionalisasi app
Sarana mengadaptasi perangkat lunak komputer ke bahasa yang berbeda, kekhasan regional dan persyaratan teknis dari target lokal. 
Aplikasi Internasionalisasi digunakan untuk pengguna yang berbicara bahasa lain.
### Internasionalisasi pendekatan JSON app
Tambahkan flutter localization di pubspec.yaml
```
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```
tambah json assets
```
assets: 
    - assets/i18n/en.json
    - assets/i18n/fr.json
```
[Kode sumber](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-05/latihan/localization_i18n)\
Widget App dengan _AppState memiliki widget AppBody yang berisi tampilan aplikasi. 
Method `onChangeLanguage` untuk mengubah bahasa aplikasi. 
`MyLocalizations.of(context)` untuk mendapatkan data bahasa dan mengubahnya pada tampilan. 
MyLocalizationsDelegate sebagai inheritance dari MyLocalizations yang menginisialisasi localizedValues. 
Method `initialize()` memiliki `loadJsonFromAsset()` dan `convertValueToString()` untuk mendeklarasi bahasa dari file json. 

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-05/latihan/record/localizationi18n.gif" width="300">

### Internasionalisasi JSON sesuai bahasa sistem
Tambahkan flutter_localizations
```
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```
Tambah json assets
```
assets: 
    - resources/lang/tr.json
    - resources/lang/en.json
```
[Kode Sumber](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-05/latihan/internationalis_json)\
Aplikasi ini mengubah bahasa inggris dan turki menyesuaikan bahasa sistem yang digunakan. 
MyApp mendeklarasi locale dan berisi tampilan widget MyPage. 
DemoLocalizations.of(context) untuk menyesuaikan text sesuai bahasa yang dipakai. 
DemoLocalizationsDelegate sebagai turunan dari DemoLocalizations yang menginisialisasi bahasa sistem.\
![Internasionalisasi](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-05/latihan/images/internationalis.PNG)
### Internasionalisasi dengan Application Resource Bundle (ARB)
ARB adalah format lokalisasi sumber daya yang sederhana (json), dapat dikembangkan dan langsung dapat digunakan. Berisi JSON dari resource ID ke localized values. 
Tambahkan dependencies
```
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
dev_dependencies:  
  intl_translation: ^0.17.7
```
[Kode Sumber](https://github.com/Fourthten/praxis-academy/tree/master/novice/03-05/latihan/arb_internasionalis)\
Buat localizations.dart, class AppLocalizations memiliki beberapa fungsi:\
fungsi load akan memuat sumber daya string dari Lokal yang diinginkan seperti di parameter.\
fungsi of akan menjadi penolong InheritedWidget lainnya untuk memfasilitasi akses ke string dari kode aplikasi.\
fungsi get akan mencantumkan sumber daya yang tersedia diterjemahkan ke aplikasi, Intl.message akan membuat alat intl mencari kelas dan mengisi inisialisasi pesan yang diterjemahkan.\
method initializeMessages akan dihasilkan oleh alat intl, impor "l10n / messages_all.dart" berisi metode yang secara efektif memuat pesan yang diterjemahkan.
`AppLocalizations` digunakan untuk merangkum sumber daya dan `AppLocalizationsDelegate` untuk menyediakan sumber daya.\
Jalankan di terminal
```
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/localizations.dart
```
ini akan generate file `intl_messages.arb`, Buat file intl_en.arb, intl_es.arb, intl_pt.arb (english, spain, portugal)\
Jalankan di terminal
```
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n --generated-file-prefix=intl_ --no-use-deferred-loading lib/localizations.dart lib/l10n/intl_es.arb lib/l10n/intl_en.arb lib/l10n/intl_pt.arb
```
ini akan generate file intl_messages_all.dart, intl_messages_en.dart, intl_messages_es.dart, intl_messages_pt.dart\
Buat main.dart, ini membuat localizationsDelegates dan supportedLocales. MyApp memanggil MyHomePage yang berisi tampilan aplikasi. 
`AppLocalizations.of(context)` digunakan sebagai penerjemah text.\
![arb](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-05/latihan/images/arb_internasionalis.PNG)

Sumber:\
[Flutter Localization the Easy Way](https://resocoder.com/2019/06/01/flutter-localization-the-easy-way-internationalization-with-json/)\
[Make an Flutter application multi-lingual](https://www.didierboelens.com/2018/04/internationalization---make-an-flutter-application-multi-lingual/)\
[Flutter Internationalization Tutorials](https://medium.com/@datvt9312/flutter-internationalization-tutorials-d8f0f711e7f)\
[Flutter — Localization: step by step](https://proandroiddev.com/flutter-localization-step-by-step-30f95d06018d)\
[Github Internationalization](https://github.com/anilcancakir/flutter-internationalization)