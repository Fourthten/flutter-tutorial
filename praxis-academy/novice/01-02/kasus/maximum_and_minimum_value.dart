main(){
  var A = [10, 20, 30, 40];
  MinMax(A);
}

MinMax(A){
    var min = A[0];
    var max = A[0];
    for(int i = 1; i<=A.length-1; i++){
      if(A[i]<min){
        min=A[i];
      }
      if(A[i]>max){
        max=A[i];
      }
    }
    print('${min} ${max}');
  }