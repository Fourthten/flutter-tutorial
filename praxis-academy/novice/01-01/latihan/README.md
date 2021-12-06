### Install SDK dan IDE Dart
Install [Dart sdk windows](https://dart.dev/get-dart)\
Setting environment path dart sdk\
Install [Android Studio](https://developer.android.com/studio) dan [VS Code](https://code.visualstudio.com/)
### Hello World
```
void main() {
  print('Hello, World!');
}
```
**note**\
Tampilkan `'Hello, World!'`.

### Variables
```
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};
```
**note**\
Deklarasi variabel beserta valuenya.

### Control Flow Statements
```
if (year >= 2001) {
  print('21st century');
} else if (year >= 1901) {
  print('20th century');
}
```
**note**\
Jika `year` >= 2001 maka tampilkan '21st century', Jika `year` >= 1901 tampilkan '20th century'.
```
for (var object in flybyObjects) {
  print(object);
}
```
**note**\
*Looping* variabel `flybyObjects` kedalam var `object` kemudian tampilkan value `object`.
```
for (int month = 1; month <= 12; month++) {
  print(month);
}
```
**note**\
*Looping* `month`=1 sampai <=12 kemudian tampilkan value `month`.
```
while (year < 2016) {
  year += 1;
}
```
**note**\
*Looping* `year` sampai <2016 kemudian `year`+1.

### Functions
```
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}
var result = fibonacci(20);
```
**note**\
variabel result memanggil `function fibonacci()` dengan value 20. Jika parameter n=0 atau n=1 maka `return n` (0 atau 1). Jika n!=0 atau n!=1 maka `return fibonacci(n - 1) + fibonacci(n - 2)` dan seterusnya.
```
flybyObjects.where((name) => name.contains('turn')).forEach(print);
```
**note**\
Mencari `name` dari variabel `flybyObjects` dimana memiliki kata 'turn' kemudian tampilkan dengan *looping*.

### Comments
```
// This is a normal, one-line comment.

/// This is a documentation comment, used to document libraries,
/// classes, and their members. Tools like IDEs and dartdoc treat
/// doc comments specially.

/* Comments like these are also supported. */
```
**note**\
Memberi komentar dokumentasi.\
File [sample.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-01/latihan/sample.dart)

### Imports
```
// Importing core libraries
import 'dart:math';

// Importing libraries from external packages
import 'package:test/test.dart';

// Importing files
import 'path/to/my_other_file.dart';
```
**note**\
*access libraries dart*. File [import.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-01/latihan/import.dart) 
atau [importdart](https://github.com/Fourthten/praxis-academy/tree/master/novice/01-01/latihan/importdart)

Sumber:\
[Dart Tool](https://dart.dev/tools)\
[Dart SDK](https://dart.dev/get-dart)\
[Dasar Dart](https://dart.dev/samples)