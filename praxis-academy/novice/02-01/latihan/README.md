### Instalasi Flutter di Windows
Flutter adalah *framework cross platform* untuk membangun *native mobile app*.
1. Download flutter terlebih dahulu [Download Flutter for Windows](https://flutter.dev/docs/get-started/install/windows)
2. Ekstrak file zip dan letakkan di folder C:\src\flutter
3. Update path flutter(flutter\bin) pada environment windows
4. *Install* android studio beserta SDK nya kemudian *set up* android device dan android emulator
5. *Install* visual studio code
6. *Install extension/plugin* dart dan flutter di VS Code dan Android Studio
7. Jalankan flutter doctor untuk mengecek android toolchain
   ```
   C:\src\flutter>flutter doctor
   ```
8. Buat *simple app* di VS Code
   ```
   View>Command Palete
   Flutter: New Project
   ```
9. Enter project name `myapp`
8. Buat atau pilih direktori `flutter project`
10. Tunggu *project* selesai di buat
11. Pilih android device
12. Jalankan app, klik `F5` atau `Debug>Start debugging` (VS Code) atau `myapp>flutter run` (Terminal)
13. Edit `lib\main.dart` lalu `save` untuk mencoba `hot reloading`\
File [main.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/latihan/main.dart)\
![first](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-01/latihan/images/main.PNG)

Sumber:\
[Install Flutter](https://flutter.dev/docs/get-started/install)\
[Lingkungan Pengembangan Flutter](https://medium.com/@kamiwabi.id/menyiapkan-lingkungan-pengembangan-untuk-flutter-9c8edf48715e)\
[Flutter Real Device](https://medium.com/@kamiwabi.id/flutter-pada-real-device-a54c9795cf74)\
[Install Visual Studio Code](https://flutter.dev/docs/get-started/editor?tab=vscode)\
[Install Android Studio](https://flutter.dev/docs/get-started/editor?tab=androidstudio)\
[Mulai Flutter dengan VS Code](https://flutter.dev/docs/get-started/test-drive?tab=vscode)\
[Mulai Flutter dengan Android Studio](https://flutter.dev/docs/get-started/test-drive?tab=androidstudio)\
[Mulai Flutter dengan Terminal](https://flutter.dev/docs/get-started/test-drive?tab=terminal)