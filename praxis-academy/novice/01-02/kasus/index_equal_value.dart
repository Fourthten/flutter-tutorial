main(){
  var A = [2,3,5,1,7,6,4];
  Index_Equal_Value(A);
}
Index_Equal_Value(T){
	int st = 1;
	int end = T.length;
	while (st<=end) {
		int mid = ((st+end)/2).floor();
		if(T[mid]==mid){
			print("mid $mid");
			return mid;
		} else if (T[mid]>mid){
			end = mid-1;
			print("end $end");
		} else {
			st = mid+1;
			print("st $st");
		}
	}
	print(T);
}