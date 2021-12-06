### BaaS
Backend-as-a-Service (BaaS) adalah model layanan cloud di mana pengembang mengalihdayakan semua aspek di balik layar dari aplikasi web atau seluler sehingga hanya perlu menulis dan memelihara frontend. 
Vendor BaaS menyediakan software pre-written untuk kegiatan yang berlangsung di server, seperti autentikasi pengguna, manajemen database, remote update, push notifikasi, cloud storage dan hosting. 
Firebase sebagai vendor BaaS.
### Koneksi Flutter Firebase
Buka console firebase dan buat projek firebase\
Register app dengan package name `com.example.baby_names`, app nickname `baby_names`, debug SHA1 di cmd:
```
keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
```
Download google-services.json dan letakan di `android\app`\
Tambah repositories google di `android\build.gradle`
```
buildscript {
    repositories {
      google()  // Google's Maven repository
    }
    dependencies {
      classpath 'com.google.gms:google-services:3.2.1'  // Google Services plugin
    }
}
allprojects {
    repositories {
      google()  // Google's Maven repository
    }
}
```
Tambah flutterfire plugin pubspec.yaml
```
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^0.4.0+9
  firebase_analytics: ^5.0.2
  cloud_firestore: ^0.12.9+5
```
Ubah sdkversion dan tambah dependencies, Edit di paling bawah `android\app\build.gradle`
```
android {
    compileSdkVersion 29
    ....
    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 29
    ....
dependencies {
    implementation 'com.google.firebase:firebase-analytics:17.2.1'
```
Tambahkan di paling bawah `android\app\build.gradle`
```
apply plugin: 'com.google.gms.google-services'
```
### Simple Baby Name App
Buat proyek flutter dengan nama `baby_names`
Buat UI [uibaby.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-03/latihan/uibaby.dart)\
![ui_baby](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-03/latihan/images/ui_babyname.PNG)\
Koneksikan Flutter dengan Firebase seperti tutorial di atas\
Pada console firebase pilih menu database>cloud firestore\
Pada security rules cloud firestore pilih test mode enable sehingga read/write public
```
match /{document=**} {
  allow read, write;
}
```
Buat Collection baby dan document seperti berikut:\
![collection](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-03/latihan/images/babyname.PNG)\
Tambahkan document baby lain seperti filip, richard, dll.\
Ubah `_buildBody` untuk call cloud firestore
```
Widget _buildBody(BuildContext context) {
 return StreamBuilder<QuerySnapshot>(
     // call firestore, snapshot data realtime
   stream: Firestore.instance.collection('baby').snapshots(),
   builder: (context, snapshot) {
     if (!snapshot.hasData) return LinearProgressIndicator();
     return _buildList(context, snapshot.data.documents);
   },
 );
}
```
Ubah `_buildList` untuk mendapatkan snapshot list document firestore
```
Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
```
Ubah `_buildListItem` untuk mendapatkan data baby dari list document firestore
```
Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
 final record = Record.fromSnapshot(data);
```
Hapus variabel `dummySnapshot` karena tidak diperlukan\
Tambah interaktifitas pada list baby.
Jika ada 2 orang vote bersamaan dengan aplikasi sama hanya 1 yang akan terupdate karena saat ini aplikasi masih membaca data saat ini yang sama kemudian di update nilai sama ke database. 
```
onTap: () => record.reference.updateData({'votes': record.votes + 1})
```
Ubah interaktifitas untuk update data votes sehingga bisa memperbaharui shared resource dan menghitung setiap votes(tidak terjadi kondisi race). 
```
onTap: () => record.reference.updateData({'votes': FieldValue.increment(1)}),
```
Untuk pendekatan yang lebih komplek bisa menggunakan transaction(opsional)
```
onTap: () => Firestore.instance.runTransaction((transaction) async {
    final freshSnapshot = await transaction.get(record.reference);
    final fresh = Record.fromSnapshot(freshSnapshot);
    await transaction
        .update(record.reference, {'votes': fresh.votes + 1});
}),
```
Jika 2 orang vote bersamaan, vote berubah diantara get dan update 
maka proses saat ini tidak dilakukan dan mengulang transaction jika gagal maksimal sampai 5 kali.\
File [babynamesfirestore.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-03/latihan/babynamesfirestore.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-03/latihan/record/babynamevoute.gif" width="300">

Sumber:\
[Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup?platform=android)\
[Codelabs](https://codelabs.developers.google.com/codelabs/flutter-firebase/#4)