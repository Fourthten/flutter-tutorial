import 'dart:async';
void hello() async {
  print('something exciting is going to happen here...');
}

class Employee {
  int id;
  String firstName, lastName;
  Employee(this.id, this.firstName, this.lastName);
}

void main() async {
  await hello();
  print('all done');

  var x = await four();
  print(x);

  print("getting employee...");
  var xx = await getEmployee(33);
  print("Got back ${xx.firstName} ${xx.lastName} with id# ${xx.id}");
}

Future<int> four() async {
 return 4;
}

Future<Employee> getEmployee(int id) async {
  //Simulate what a real service call delay may look like by delaying 2 seconds   
  await Future<Employee>.delayed(const Duration(seconds: 2));
  //and then return an employee - lets pretend we grabbed this out of a database 
  var e = new Employee(id, "Joe", "Coder");
  return e;
}