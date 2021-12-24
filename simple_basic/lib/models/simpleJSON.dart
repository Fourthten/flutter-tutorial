/**
 {
   "id":"123",
   "name":"Setia",
   "score":90
 }
 */
class Student {
  String id;
  String name;
  int score;

  Student({
    required this.id,
    required this.name,
    required this.score
  });

  factory Student.fromJson(Map<String,dynamic> json){
    return Student(
      id:json["id"],
      name:json["name"],
      score:json["score"]
    );
  }
}