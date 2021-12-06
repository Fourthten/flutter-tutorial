main(){
  var A = [2,3,5,1,7,6,4];
  SelectionSort(A);
}
SelectionSort(A){
  for(int i=0; i<=A.length-2; i++){
    var indexMin;
    indexMin = i;
    for(int j=i+1; j<=A.length-1; j++){
      if(A[j]<A[indexMin]){
        indexMin = j;
      }
    }
    if(indexMin!=i){
      var temp;
      temp=A[i];
      A[i]=A[indexMin];
      A[indexMin]=temp;
    }
  }
  print(A);
}