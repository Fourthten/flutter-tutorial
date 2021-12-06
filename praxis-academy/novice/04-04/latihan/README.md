### Membuat Flavors Android
Produk flavor mirip dengan build type, dengan flavor dapat menentukan konfigurasi build dan mengubahnya sesuai keinginan. 
Dengan flavor dapat membuat beberapa aplikasi dengan sumber kode yang sama namun berbeda konfigurasi. Contoh flavor,\
Buat projek flutter `flutter create flavorsexample`\
Buat aplikasi seperti kode dart berikut: [FlutterApp](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-04/latihan/libfluterflavor)\
Install flutter package
```
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.15.7
```
Tambahkan [images](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-04/latihan/imageflavor) di folder `assets`\
Konfigurasi flavor di `android\app\build.gradle`
```
    defaultConfig { ... }
    flavorDimensions "app"
    productFlavors {
        app1 {
            dimension "app"
            applicationId "com.example.flavorsexample.app1"
            versionCode 1
            versionName "1.0"
        }
        app2 {
            dimension "app"
            applicationId "com.example.flavorsexample.app2"
            versionCode 1
            versionName "1.0"
        }
    }
    buildTypes { ... }
```
Konfigurasi `AndroidManifest`
```
<application
    android:name="io.flutter.app.FlutterApplication"
    android:label="@string/app_name"
    android:icon="@mipmap/ic_launcher">
```
Tambahkan file strings.xml di `android/app/src/main/res/values`
```
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">Default App Name</string>
</resources>
```
Tambahkan file strings.xml di `android/app/src/app1/res/values`
```
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">App 1</string>
</resources>
```
Tambahkan file strings.xml di `android/app/src/app2/res/values`
```
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">App 2</string>
</resources>
```
Jalankan `flutter run --flavor app1` atau `flutter run --flavor app2`. `flutter clean` untuk membersihkan cache.\
![app](https://github.com/Fourthten/praxis-academy/blob/master/novice/04-04/latihan/images/app1.PNG)\
Tambahkan Flavors, buat main_common, main_app1, main_app2 untuk membedakan aplikasi. Kode seperti ini [flavorapp](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-04/latihan/libflavor)\
app_config.dart untuk mengkonfigurasi nama tampilan aplikasi dan internal id aplikasi. 
home_page.dart untuk menampilkan UI aplikasi. 
Jalankan di terminal `flutter run --flavor app1 -t lib/main_app1.dart` atau 
`flutter run --flavor app2 -t lib/main_app2.dart`\
![flavor](https://github.com/Fourthten/praxis-academy/blob/master/novice/04-04/latihan/images/flavorapp2.PNG)\
Custom beberapa sumber string dan assets pada flavor, Contoh file [customflavor](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-04/latihan/libcustom)\
app_config.dart untuk mengkonfigurasi nama tampilan aplikasi, string sumber, internal id aplikasi. 
display_strings_app1.dart dan display_strings_app2.dart berisi sumber string. 
Gunakan internal id aplikasi pada home_page.dart untuk membedakan assets. 
Jalankan di terminal `flutter run --flavor app1 -t lib/main_app1.dart` atau 
`flutter run --flavor app2 -t lib/main_app2.dart`\
![flavor](https://github.com/Fourthten/praxis-academy/blob/master/novice/04-04/latihan/images/flavorapp.png)
### Development flavor
Buat projek `flutter_flavors` dengan kode dart seperti ini [develop release flavor](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-04/latihan/libdevelop)\
Konfigurasi `android\app\build.gradle`
```
flavorDimensions "flavor-type"
    productFlavors {
        development {
            dimension "flavor-type"
            applicationIdSuffix ".dev"
            versionNameSuffix "-dev"
        }
        production {
            dimension "flavor-type"
        }
    }
```
`main.dart` call flavor release dan `main-dev.dart` call flavor development. 
Pada `config.dart` mengkonfigurasi aplikasi flavor apa yang akan dipanggil (release atau development) 
dengan String `helloMessage` berisi text dan Icon `helloIcon` berisi icon. 
`appEntry.dart` berisi kode dart yang menampilkan UI dari aplikasi flavor dengan get data `helloMessage` dan `helloIcon`.\
`flutter run --flavor development -t lib/main-dev.dart`\
![dev](https://github.com/Fourthten/praxis-academy/blob/master/novice/04-04/latihan/images/development.PNG)\
`flutter run --flavor production -t lib/main.dart`\
![rel](https://github.com/Fourthten/praxis-academy/blob/master/novice/04-04/latihan/images/release.PNG)

Sumber:\
[Creating flavors of a Flutter app](https://cogitas.net/creating-flavors-of-a-flutter-app/)\
[Flavoring FLutter](https://medium.com/@salvatoregiordanoo/flavoring-flutter-392aaa875f36)\
[Ready to Go](https://medium.com/flutter-community/flutter-ready-to-go-e59873f9d7de)