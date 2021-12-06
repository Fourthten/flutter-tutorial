main(){
  //var is static typedata
  var name = 'Agung';
  print(name);
  //dynamic is dinamic typedata
  dynamic num = 234;
  num = 'hey';
  print(num);
  String place = 'Yogya';
  print(place);
  int no = 2;
  print(no);
  //tidak harus memiliki nilai saat kompilasi
  final waktu = new DateTime.now();
  print(waktu);
  //harus memiliki nilai saat kompilasi
  const con = 3.14;
  print(con);
  var operate = 3>=2?"benar":"salah";
  var first = 6~/2;
  var second = 5%2;
  print(operate+" $first & $second");
  //check type
  var emp = 2;
  if (emp is String) {
    print(emp);
  }
  emp = emp as int;
  final bool1 = true;
  final bool2 = false;
  if(bool1 & bool1){print("AND");}
  if(bool1 | bool2){print("OR");}
  if(bool1 ^ bool1){print("XOR");}
  //pergeseran bit
  int x = 128>>2;
  print (x);
  int y = 128<<1;
  print (y);
  int z = ~5-1;
  print (z);
  //z? null
  var zz = z ?? 'zero';
  print(zz);
  var loop = ['A', 'B', 'C', 'D'];
  loop.forEach((l)=>print(l));
  int i=2;
  while (i <= 10){
    i+=2; 
    if(i==2){
      continue;
    }
    if(i==6){
      break;
    }
    print(i);
  }
  do{
    print(i);
    i++;
  } while (i <= 8);
  int r = 2;
  switch (r) {
    case 0:
      print(r);
      break;
    case 2: 
      print(r);
      break;
  }
  //dart --enable-asserts main.dart
  var test = false;
  assert(test ? true : throw "message");
  assert(((3 << 1) == 6), "text");
  try {
    dynamic a=true;
    print(a++);
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  } finally {
    //error atau tidak tetap running
    print('final');
  }
  //runes = array dr string berikut dalam bentuk ASCII
  String nama = "my name";
  nama.runes.forEach((c){
    print("${c} => ${String.fromCharCode(c)}");
  });
  //symbol
  Symbol APP_NAME = new Symbol('Aplikasi');
  print(APP_NAME);
  Map orang = {
    'nama': 'my name',
    Symbol('nama'): 'my'
  };
  print(orang);
  if(new Symbol("foo") == new Symbol("foo")){print("ya");}
  if(new Symbol("foo.bar") == #foo.bar){print("yes");}
}