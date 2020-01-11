import 'dart:convert' show json;
import 'dart:io' show File;

void main() async {
  String jsonString = await File('student.json').readAsString();
  final Map jsonResponse = json.decode(jsonString);
  Student student = Student.fromJson(jsonResponse);
  print(jsonString);
  print(jsonResponse);
  print(jsonResponse['id']);
  print(student);
  print(student.studentName);
}

class Student {
  String studentId;
  String studentName;
  int studentScores;

  Student({this.studentId, this.studentName, this.studentScores});

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
        studentId: parsedJson['id'],
        studentName: parsedJson['name'],
        studentScores: parsedJson['score']);
  }
}
