### Object Oriented Programing
Fungsi atau method dan variabel atau atribut dibungkus dalam sebuah class yang saling berinteraksi membentuk program.
### Class
Rancangan sebuah object, objek dalam pemrograman adalah sebuah variabel atau instance dari class.
- enkapsulasi memudahkan menggunakan objek dari kelas tanpa perlu mengetahui detailnya. contoh: class mobil menyediakan fungsi menjalankan mobil tanpa kita perlu tahu komposisinya.
- inheritance mewarisi sifat kelas kepada kelas turunan. semakin bawah maka semakin spesifik dimana kode pada kelas super ditulis berulang kali pada kelas turunan tanpa menulis ulang semua kode.
- polymorphisme kemampuan objek yang berbeda kelas untuk memutuskan method yang akan diterapkan. pesan dapat memanggil method berbeda dengan panggilan yang sama.
### Constructor 
Adalah method khusus yang akan dieksekusi pada saat pembuatan objek. 
Biasanya constructor digunakan untuk inisialisasi data. 
Sebagai suatu method yang akan memberikan nilai awal pada saat suatu objek dibuat
### Getter Setter
Metode getter mengembalikan nilai dari variabel. 
Metode setter mengambil parameter dan memberikan ke variabel. 
Contoh [gettersetter.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-03/latihan/gettersetter.dart)
### Method
Adalah fungsi yang menyediakan perilaku obyek. Method merupakan suatu operasi berupa fungsi-fungsi yang dapat dikerjakan oleh suatu obyek.
Contoh [method.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-03/latihan/method.dart)
### Abstract Method dan Class
Abstract Method adalah method yang diimplementasikan ulang di dalam child class. 
Abstract method ditulis tanpa isi dari method. 
Abstract class digunakan di dalam inheritance untuk memaksakan implementasi method yang sama bagi seluruh class yang diturunkan dari abstract class. 
```
abstract class Abstrak {
  void doSomething(); // abstract method.
}
class InheritanceAbstrak extends Abstrak {
  void doSomething() {
  }
}
```
### Implicit Interface
Implicit Interface adalah class yang hanya mengandung deklarasi method tanpa memiliki implementasu dan semua properti yang dimilikinya bersifat final. 
Contoh [implicitinterface.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-03/latihan/implicitinterface.dart)
### Extend Class
Untuk membuat subclass inheritance. Contoh [extends.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-03/latihan/extends.dart)
### Mixin
Menggunakan kembali kode kelas dalam banyak hierarki kelas. 
Berisi method untuk digunakan oleh kelas lain tanpa harus menjadi parent class dari kelas-kelas lain. 
Contoh [mixin.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-03/latihan/mixin.dart)

Sumber:\
[Dart Language Tour](https://dart.dev/guides/language/language-tour#adding-features-to-a-class-mixins)