asynchronous berarti tidak berurutan, await menunggu proses selesai. 
Contoh [asyncawait.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-05/latihan/asyncawait.dart). 
Contoh lain menggunakan multiple async [multipleasyn.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-05/latihan/multipleasyn.dart).\
Untuk mengulang satu set panggilan async, gunakan Future.forEach. Contoh [iterating.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-05/latihan/iterating.dart).\
Untuk menjalankan beberapa kode ketika semua panggilan async telah selesai, gunakan Future.wait, contoh [waiting.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-05/latihan/waiting.dart).\
Untuk penanganan kesalahan pada asynchronous, Contoh [errorhandling.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-05/latihan/errorhandling.dart).\
Future digunakan untuk mewakili nilai potensial, atau kesalahan, yang akan tersedia pada suatu waktu di masa mendatang. 
Future mewakili hasil operasi asynchronous dengan dua status completed atau uncompleted. 
Completed apabila operasi sukses maka future dilengkapi nilai. Uncompleted mengembalikan future tidak lengkap karena menunggu function asynchronous untuk menyelesaikan. 
Future mewakili perhitungan yang tidak selesai dengan segera dimana fungsi normal mengembalikan hasilnya, fungsi asynchronous mengembalikan Future, yang pada akhirnya akan berisi hasilnya. 
Future akan memberi tahu ketika hasilnya siap. Contoh file [contohfuture.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-05/latihan/contohfuture.dart).\
Streams adalah urutan event asynchronous. Streams memberi tahu ada event saat siap pada iterasi. 
File [streams.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-05/latihan/streams.dart). 
Contoh error handling [trycatchstream.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-05/latihan/trycatchstream.dart).\
Dart Native(ust-in-time (JIT) virtual machine (VM) ahead-of-time (AOT)) untuk mobile, desktop, server. Dart Web untuk web. Dart Native memungkinkan menjalankan kode Dart yang dikompilasi dengan kode mesin ARM atau X64 untuk aplikasi mobile, desktop, dan server.\
Dart Efektif dengan 2 tema menyeluruh, konsisten dan singkat. 
Isolates yaitu tempat semua kode Dart berjalan. Konkurensi adalah landasan umum perancangan dimana proses-proses terjadi secara bersamaan. 
Istilah Kontruksi Dart terdiri dari Member library yaitu top-level field, getter, setter, function di tingkat atas yang bukan tipe.
Member class yaitu constructor, field, getter, setter, function, operator dan dapat berupa instance atau statis, abstrak atau konkret yang dideklarasikan di dalam class. 
Member yaitu anggota library atau class. Variabel yaitu variabel top-level, parameter, local variabel. 
Type yaitu deklarasi tipe apapun, class, typedef atau enum. Property yaitu variabel top-level, getter setter, field(instance atau static). 

Sumber:\
[Contoh Async Await](https://codingwithjoe.com/dart-fundamentals-async-await/)\
[Tutorial Futures](https://dart.dev/codelabs/async-await)\
[Tutorial Streams](https://dart.dev/tutorials/language/streams)\
[Dokumentasi Dart](https://dart.dev/guides)\
[Dart Plaform](https://dart.dev/platforms)