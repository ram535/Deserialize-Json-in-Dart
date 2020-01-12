import 'dart:convert' show json;
import 'dart:io' show File;

void main() async {
  String jsonString = await File('student.json').readAsString();
  final Map jsonResponse = json.decode(jsonString);
  Student student = Student.fromJson(jsonResponse);
  print(student.classes);
}

class Student {
  final String id;
  final String name;
  final List<String> classes;

  Student({this.id, this.name, this.classes});

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    var classesFromJson = parsedJson['classes'];
    print(classesFromJson.runtimeType);
    // List<String> classesList = List<String>.from(classesFromJson);
    List<String> classesList = classesFromJson.cast<String>();
    return Student(
        id: parsedJson['id'], name: parsedJson['name'], classes: classesList);
  }
}
