## Animasi
AnimationController adalah objek animasi khusus yang menghasilkan nilai baru 
setiap kali hardware siap untuk bingkai baru. Secara linear menghasilkan durasi 0,0 sampai 1,0. 
```
controller =
    AnimationController(duration: const Duration(seconds: 2), vsync: this);
```
`vsync` mencegah animasi offscreen menggunakan sumber daya yang tidak perlu. 
Tween adalah objek stateless terdiri dari `begin` dan `end` yang menentukan pemetaan dari rentang input ke rentang output. 
Tween mewarisi dari Animatable<T>. Contoh animasi, [exampleanimation.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/exampleanimation.dart)\
AnimatedWidget memisahkan kode core widget dengan kode animasi. 
Contoh file, [simpleanimation.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/simpleanimation.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/record/simpleanimation.gif" width="300">

`addStatusListener()` memunculkan notifikasi untuk mengetahui kapan animasi berubah keadaan, seperti finishing, moving forward, atau reversing `..addStatusListener((state) => print('$state'));`. 
File [animationmonitoring.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/animationmonitoring.dart)\
AnimatedBuilder untuk memperbaiki atau membangun kembali struktur kode(refactoring). Struktur `Container->GrowTransition->AnimatedBuilder->(AnonymousBuilder)->LogoWidget`. File [refactoring.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/refactoring.dart)\
Animasi Simultan, contoh menggunakan multiple tween pada animation controller yang sama [simultaneousanimate.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/simultaneousanimate.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/record/simultananimate.gif" width="300">

### Hero Animasi
Basic struktur hero animasi, implementasinya satu mendeskripsi widget route sumber dan lain mendeskripsi widget route tujuan. 
Strukturnya, tentukan awal dan akhir widget Hero, buat route berisi hero tujuan, memicu animasi dengan push route tujuan pada navigator stack.\
Simple Hero Animasi, File [simplehero.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/simplehero.dart), 
tambah folder [images](https://github.com/Fourthten/praxis-academy/tree/master/novice/02-04/latihan/imagesstandar), pubspec.yaml:
```
assets:
    - images/flippers-alpha.png
```
import package scheduler(timeDilation) untuk kecepatan animasi dan material. runApp panggil widget `HeroAnimation` berisi Scaffold. 
Scaffold body panggil widget `PhotoHero` dengan parameter photo, width, onTap. onTap menavigasi ke layar kedua berisi Scaffold dengan style body berbeda. 
body layar kedua call PhotoHero dengan parameter photo, width, onTap juga. onTap kembali ke layar pertama. Widget `PhotoHero` untuk mengatur style foto. 
InkWell membangun rute baru dan push ke stack navigator.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/record/standarhero.gif" width="300">

Radial hero animasi, melebarkan gambar dari radius min ke max. File [radialhero.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/radialhero.dart), 
tambah folder [images](https://github.com/Fourthten/praxis-academy/tree/master/novice/02-04/latihan/imagesradial), pubspec.yaml:
```
assets:
    - images/beachball-alpha.png
    - images/binoculars-alpha.png
    - images/chair-alpha.png
```
import math, material, scheduler(timeDilation), runApp widget `RadialExpansionDemo` yang berisi 3 gambar pada body Scaffold. masing-masing gambar memiliki `_buildHero` yang berisi widget `RadialExpansion`(control radial) dan `Photo`(style photo). 
onTap menavigasi ke `_buildPage` yang berisi widget `RadialExpansion`(control radial) dan `Photo`(style photo) juga serta onTap untuk menavigasi ke halaman sebelumnya.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/record/radialhero.gif" width="300">

### Staggered animasi
Perubahan visual terjadi secara berurutan atau berangkaian.\
Basic staggered animasi, File [basicstaggered.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/basicstaggered.dart).\
import async, material, scheduler. runApp call `StaggerDemo` dengan State `_StaggerDemoState` yang menampilkan kotak pada layar. 
onTap di dalamnya menjalankan fungsi `_playAnimation` yang meneruskan dan mengembalikan animasi `_controller`. 
Di dalam widget tersebut berisi widget `StaggerAnimation` yang dijalankan oleh `_controller`. 
`StaggerAnimation` mengatur animasi, dimulai dari opacity 0.0 - 1.0 (curve 0.0 - 0.100), width 0.50 - 0.150 (curve 0.125 - 0.250), 
height 50.0 - 150.0 (curve 0.250 - 0.375), padding bottom 16.0 - 75.0 (curve 0.250 - 0.375), borderRadius circular 4.0 - 75.0 (curve 0.375 - 0.500), 
ColorTween biru ke jingga (curve 0.500 - 0.750).

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/latihan/record/staggered.gif" width="300">

Sumber:\
[Tutorial Animasi](https://flutter.dev/docs/development/ui/animations/tutorial)\
[Hero Animations](https://flutter.dev/docs/development/ui/animations/hero-animations)\
[Staggered Animations](https://flutter.dev/docs/development/ui/animations/staggered-animations)