class Person {
  // interface
  final _name;
  // constructor.
  Person(this._name);
  // interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}
// Implementasi Person interface.
class Impostor implements Person {
  get _name => '';
  String greet(String who) => 'Hi $who. Do you know who I am?';
}
String greetBob(Person person) => person.greet('Bob');
void main() {
  print(greetBob(Person('Kathy')));
  print(greetBob(Impostor()));
}