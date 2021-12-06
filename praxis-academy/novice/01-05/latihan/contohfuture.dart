// main(){
//   getFuture();
//   print("show");
// }
Future<void> getFuture(){
  return Future.delayed(Duration(seconds: 2), ()=> print("print"));
  // return Future.delayed(Duration(seconds: 3), () => throw Exception('Logout failed: user ID is invalid'));
}

main(){
  Future.delayed(
    const Duration(seconds: 3), () => 50
  ).then((nilai) {
    print('Nilainya $nilai.');
  });
  print('Menunggu nilai..');
}