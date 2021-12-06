Mengambil data json atau endpoint url menggunakan asynchronous kemudian menulisnya pada file teks. 
Contoh file [getcontent.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-05/kasus/getcontent.dart) 
atau [getdata.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-05/kasus/getdata.dart).\
Gunakan `HttpClient().getUrl(Uri.parse())` untuk mengambil data json dari endpoint/url. 
Pada file getcontent.dart data yang telah diambil dari endpoint kemudian di tulis pada file baru dengan perintah `pipe(new File('read.txt').openWrite())`. 
Pada file getdata.dart data yang telah diambil dari endpoint kemudian di tulis pada file baru dengan perintah `File('get.txt').writeAsString(x)` 
setelah file terbentuk lalu di baca dengan perintah `readAsString` dan dibuat salinannya dengan perintah `File('get-copy.txt').writeAsString(contents)`.