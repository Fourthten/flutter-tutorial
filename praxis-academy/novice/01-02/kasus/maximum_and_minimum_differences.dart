main(){
  var A = [3,8,2,4,5,1];
  MaxDifference(A);
  MinDifference(A);
}
MaxDifference(A){
  var maxDiff = A[1]-A[0];
  var min = A[0];
  for(int i=1; i<A.length; i++){
    if(A[i]-min>maxDiff){
      maxDiff=A[i]-min;
    }
    if(A[i]<min){
      min=A[i];
    }
  }
  print(maxDiff);
}
MinDifference(A){
  /*Merge-Sort(A,0,A.length-1);
  var MinDiff=abs(A[0]-A[1]);
  for(int i=2; i<=A.length-1; i++){
    var diff =abs(A[i-1]-A[i]);
    if(minDiff<diff){
      minDiff=diff;
    }
  }
  print(minDiff);*/
}