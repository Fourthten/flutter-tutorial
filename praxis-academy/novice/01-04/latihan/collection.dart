import 'dart:collection';
var list = [1, 2, 3];
var colset = {'fluorine', 'chlorine', 'bromine'};
var colmap = {
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};
main(){
  //list
  print(list[1]);
  var lst = new List(3); 
  lst[0] = 12; 
  lst[1] = 13; 
  lst[2] = 11; 
  print(lst);
  var lst2 = new List(); 
  lst2.add(12); 
  lst2.add(13); 
  print(lst2);

  //set
  print(colset);
  for(var sets in colset){
    print(sets);
  }
  var lists = [];
  colset.forEach((element) => lists.add(element));
  print(lists[1]);
  Set numberSet = new Set(); 
  numberSet.add(100); 
  numberSet.add([20, 30]);
  numberSet.remove(100);
  numberSet.clear();
  numberSet.addAll([100,200,300]); 
  print(numberSet);
  // need 'dart:collection';
  Set numberSet2 = new HashSet(); 
  numberSet2.add(100); 
  numberSet2.add(20);
  print(numberSet2);

  //map
  var noble = Map();
  noble[2] = 'helium';
  noble[10] = 'neon';
  noble[18] = 'argon';
  print(colmap['first']);
  // need 'dart:collection';
  var accounts = new HashMap(); 
  accounts['dept']='HR'; 
  accounts['name']='Tom'; 
  accounts.remove('dept');
  accounts.clear();
  accounts.addAll({'dept':'HR','email':'tom@xyz.com'});
  print(accounts);

  //generic
  DataMap<int> dataMap = new DataMap(2);
  print(dataMap.getData());
  dataMap.setData(4);
  print(dataMap.getData());

  List<int> listgen = [11,12,13];
  print(listgen);
}

class DataMap<T> {
  T data;
  DataMap(this.data);
  getData() {
    return data;
  }
  setData(data) {
    this.data = data;
  }
}