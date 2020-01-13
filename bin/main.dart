import 'dart:convert' show json;
import 'dart:io' show File;

void main() async {
  String jsonString = await File('school.json').readAsString();
  final Map<String, dynamic> jsonResponse =
      json.decode(jsonString) as Map<String, dynamic>;
  School school = School.fromJson(jsonResponse);
  print(school.students[0].name);
}

class School {
  final String schoolName;
  final List<Student> students;

  School({this.schoolName, this.students});

  factory School.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['students'].runtimeType); //List<dynamic>
    var list = parsedJson['students'] as List;
    List<Student> studentList = list
        .map((dynamic i) => Student.fromJson(i as Map<String, dynamic>))
        .toList();
    // List<Student> studentList =
    //     list.map<Student>((i) => Student.fromJson(i)).toList();
    return School(
        schoolName: parsedJson['schoolName'] as String, students: studentList);
  }
}

class Student {
  String name;
  double score;
  Student({this.name, this.score});
  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
        name: parsedJson['name'] as String,
        score: parsedJson['score'] as double);
  }
}
