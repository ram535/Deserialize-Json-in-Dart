import 'dart:convert' show json;
import 'dart:io' show File;

void main() async {
  String jsonString = await File('student.json').readAsString();
  final Map jsonResponse = json.decode(jsonString);
  Student student = Student.fromJson(jsonResponse);
  print(student.topicScores);
}

class Student {
  final String name;
  final Map<String, int> topicScores;

  Student({this.name, this.topicScores});

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    var topicScoresFromJson = parsedJson['topicScores'];
    print(topicScoresFromJson.runtimeType);
    Map<String, int> topicScoresList =
        Map<String, int>.from(topicScoresFromJson);
    // Map<String, int> topicScoresList = topicScoresFromJson.cast<String, int>();
    return Student(name: parsedJson['name'], topicScores: topicScoresList);
  }
}
