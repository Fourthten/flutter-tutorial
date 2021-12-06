var A = [30, 20, 50, 40, 10];
main(){
  for(int i=1; i<=A.length-1; i++){
    var key = A[i];
    int j = i;
    while (j > 0 && A[j-1] > key){
      A[j] = A[j-1];
      j = j-1;
    }
    A[j] = key; 
  }
  print(A);
}