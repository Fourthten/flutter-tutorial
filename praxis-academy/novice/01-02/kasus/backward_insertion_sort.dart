var A = [20, 40, 30, 50];
main(){
  for(int i=A.length-2; i>=0; i--){
    var key = A[i];
    int j = i+1;
    while (j<A.length-1 && key > A[j]){
      A[j-1]=A[j];
      j=j+1;
    }
    A[j-1]=key;
  }
  print(A);
}