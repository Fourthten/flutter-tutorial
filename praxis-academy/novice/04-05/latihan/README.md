### Fastlane untuk CD
Continous delivery merupakan pendekatan rekayasa perangkat lunak di mana tim memproduksi perangkat lunak dalam siklus singkat, 
memastikan bahwa perangkat lunak dapat dirilis setiap saat dan dapat melakukannya secara manual. 
Ini bertujuan untuk membangun, menguji, dan merilis perangkat lunak dengan kecepatan dan frekuensi yang lebih besar. 
Pendekatan ini membantu mengurangi biaya, waktu, dan risiko pengiriman perubahan dengan memungkinkan pembaruan lebih lanjut untuk aplikasi dalam produksi. 
Proses penyebaran langsung dan berulang sangat penting untuk pengiriman terus menerus.\
Fastlane adalah cara termudah untuk mengotomatiskan penyebaran dan rilis beta untuk aplikasi iOS dan Android. 
Ini menangani tugas seperti menghasilkan tangkapan layar, berurusan dengan penandatanganan kode, dan melepaskan aplikasi Anda.\
Pertama install Ruby, [Download Ruby + Dev Kit](https://www.ruby-lang.org/en/downloads/) dan MSYS2/MINGW `ridk install` kemudian install [RubyGems](https://rubygems.org/pages/download#formats). 
Setelah RubyGems di install, lalu install fastlane `gem install fastlane`. 
Buat apk flutter projek `flutter build apk --release`\
Inisialisasi fastlane di `[project]\android` dengan `fastlane init`. isi nama package `com.example.batterylevel`, json path `enter`, uploading google play `no`. 
Perintah ini akan generate folder [fastlane](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-05/latihan/fastlane)\
Cocokan nama package di `[project]\android\fastlane\Appfile` dengan AndroidManifest.xml. Appfile mendefinisikan informasi konfigurasi global aplikasi. 
Fastfile mendefinisikan "lanes" sebagai drive perilaku fastlane. Setelah konfigurasi dengan Google Play lalu jalankan `fastlane supply init`

Sumber:\
[Setup Fastlane](https://docs.fastlane.tools/)\
[Continuous delivery with Flutter](https://flutter.dev/docs/deployment/cd)