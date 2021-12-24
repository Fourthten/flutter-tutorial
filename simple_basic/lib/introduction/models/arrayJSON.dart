/**
 "class": "XII",
 "subject": ["Physics", "Chemistry", "Maths"]
 */

class Student {
  String standard;
  List<String> subjects;

  Student({
    required this.standard,
    required this.subjects
  });

  factory Student.fromJson(Map<String,dynamic> json){
    var subjectsFromJson=json["subjects"];
    List<String> subjectsList=new List<String>.from(subjectsFromJson);
    return Student(
      standard: json["class"],
      // subjects: json["subjects"]
      subjects: subjectsList
    );
  }
}