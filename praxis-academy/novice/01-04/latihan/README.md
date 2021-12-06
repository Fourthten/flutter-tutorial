
List urut berdasarkan index
```
var list = [1, 2, 3];
```
Set berisi kumpulan yang isinya ada sekali, tidak perlu urut. 
HashSet adalah implementasi Set berbasis tabel hash yang tidak teratur.
```
var colset = {'fluorine', 'chlorine', 'bromine'};
```
Map seperti json memiliki key dan value bersifat dinamis bisa berubah. 
HashMap adalah implementasi Map berbasis tabel hash. Tidak bisa mengharapkan pesan tertentu saat iterasi key atau value.
```
var colmap = {
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};
```
Generic yaitu gaya pemrograman dimana tipe data sebagai parameter dapat ditentukan dan kemudian akan dipakai bila diperlukan.
```
List<int> list = [11,12,13];
```
Classes generics
```
main(List<String> args) {
  Dog d = new Dog('Duffy', 2);
  print(d.name);
}
class Dog {
  String name;
  int age;
  Dog(String name, String age) {
    this.name = name;
    this.age = age;
  }
}
```
Named Constructor generics
```
main(List<String> args) {
  Dog d = new Dog.newBorn();
  print(d.name);
}
class Dog {
  String name;
  int age;
  Dog(this.name, this.age);
  Dog.newBorn() {
    name = 'Doggy';
    age = 0;
  }
}
```
Inheritance generics
```
main(List<String> args) {
  Pug p = new Pug('Duffy', 5);
  print(p.name);
}
class Dog {
  String name;
  int age;
  Dog(this.name, this.age);
  Dog.newBorn() {
    name = 'Doggy';
    age = 0;
  }
}
class Pug extends Dog {
  Pug(String name, int age): super(name, age);
}
```
File [collection.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-04/latihan/collection.dart)

Sumber:\
[Dart Language Tour](https://dart.dev/guides/language/language-tour)\
[Coding Concepts - Generics](https://dev.to/designpuddle/coding-concepts---generics-34cf)
[Tutorial Classes and Generics](http://thetechnocafe.com/just-enough-dart-for-flutter-tutorial-03-classes-and-generics/)\
[Programming with Object Orientation and Generics](https://blog.usejournal.com/intermediate-programming-with-dart-a4b981a1a552)