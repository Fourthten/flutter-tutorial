## Widget Animasi dan Motion
### AnimatedBuilder
AnimatedBuilder berguna untuk widget yang lebih kompleks. 
Widget spinner memiliki _SpinnerState yang berisi AnimationController untuk mengatur durasi animasi. 
build berisi `Container` dan memiliki `Transform.rotate` sebagai animasi rotasi. 
Contoh di file [simplespinner.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/kasus/simplespinner.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/kasus/record/simplespin.gif" width="300">

Rotation Transition, sebagai animasi rotasi dari widget. 
Widget AnimateDemo memiliki AnimateDemoState yang berisi AnimationController untuk mengatur durasi animasi dengan pengulangan. 
build nya memiliki body yang memanggil widget RotationTransition yang berisi parameter turns, alignment, child. 
Widget RotationTransition mengatur animasi `Transform` rotasi. 
Contoh [rotationtransition.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/kasus/rotationtransition.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/kasus/record/rotationtransition.gif" width="300">

Scale Transition, sebagai animasi skala dari widget. 
Widget AnimateDemo memiliki AnimateDemoState yang berisi AnimationController untuk mengatur durasi animasi dengan pengulangan. 
build nya memiliki body yang memanggil widget ScaleTransition yang berisi parameter scale, alignment, child. 
Widget ScaleTransition mengatur animasi `Transform` scale. 
Contoh [scaletransition.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/kasus/scaletransition.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/kasus/record/scaletransition.gif" width="300">

Slide Transition, sebagai animasi posisi dari widget relatif terhadap posisi normal. 
Widget AnimateDemo memiliki AnimateDemoState yang berisi AnimationController untuk mengatur durasi animasi dengan pengulangan dan `Animation<Offset>` untuk mengatur posisi animasi. 
build nya memiliki body yang memanggil widget SlideTransition yang berisi parameter position, textDirection, child. 
Widget SlideTransition mengatur animasi FractionalTranslation dengan transformHitTests(Apakah pengujian hit harus dipengaruhi oleh slide animasi) true. 
FractionalTranslation memindahkan child secara fraksional sehubungan dengan parent. 
Jika textDirection(Arah yang digunakan untuk x offset yang dijelaskan oleh position) right to left maka atur offset. 
Contoh [slidetransition.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/kasus/slidetransition.dart)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/02-04/kasus/record/slidetransition.gif" width="300">

Sumber:\
[Animation and motion widgets](https://flutter.dev/docs/development/ui/widgets/animation)