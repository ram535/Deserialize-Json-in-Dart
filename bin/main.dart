import 'dart:convert' show json;
import 'dart:io' show File;

void main() async {
  String jsonString = await File('student.json').readAsString();
  final Map jsonResponse = json.decode(jsonString);
  Student student = Student.fromJson(jsonResponse);
  print(student.score.art);
}

class Student {
  final String name;
  final Score score;

  Student({this.name, this.score});

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
        name: parsedJson['name'], score: Score.fromJson(parsedJson['score']));
  }
}

class Score {
  double math;
  double spanish;
  double art;
  Score({this.math, this.spanish, this.art});
  factory Score.fromJson(Map<String, dynamic> json) {
    print(json.runtimeType);
    print(json['math'].runtimeType);
    return Score(
        math: json['math'], spanish: json['spanish'], art: json['art']);
  }
}
