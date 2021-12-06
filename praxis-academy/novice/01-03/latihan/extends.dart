class orang {
  var x;
  static name(x){
    var y = x+"chan";
    return y;
  }
}

class karyawan extends orang {
  @override

  static fullname(b){
    var a = orang.name(b);
    return a;
  }
  //invoke ()
  //curely base {}
  //overload
  void printw(){

  }
  //void printw(String name){
  //  return name;

  //}
  //overload
}

main(){
  var b = karyawan.fullname('key');
  var karyawn = karyawan();
  karyawn.printw();
  print(b);
}