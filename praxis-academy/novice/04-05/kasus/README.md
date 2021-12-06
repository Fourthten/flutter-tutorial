Fastlane adalah cara termudah untuk mengotomatiskan penyebaran dan rilis beta untuk aplikasi iOS dan Android. 
Ini menangani tugas seperti menghasilkan tangkapan layar, berurusan dengan penandatanganan kode, dan melepaskan aplikasi Anda.\
Pertama install Ruby, [Download Ruby + Dev Kit](https://www.ruby-lang.org/en/downloads/) dan MSYS2/MINGW `ridk install` kemudian install [RubyGems](https://rubygems.org/pages/download#formats). 
Setelah RubyGems di install, lalu install fastlane `gem install fastlane`. 
Buat apk flutter projek `flutter build apk --release`\
Inisialisasi fastlane di `[project]\android` di `fastlane init`. isi nama package `com.example.localization`, json path `enter`, uploading google play `no`. 
Perintah ini akan generate folder [fastlane](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-05/kasus/fastlane). 
Cocokan nama package di `[project]\android\fastlane\Appfile` dengan AndroidManifest.xml