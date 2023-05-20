import 'package:any_questions/models/question_answer.dart';

class Lecture {
  final String id;
  final bool permission;
  final String timestamp;
  final List<QuestionAnswer> summary;

  Lecture(
      {required this.id,
      required this.permission,
      required this.timestamp,
      required this.summary});


  // factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
  //   id: json["id"],
  //   permission: json["permission"],
  //   timestamp: json["timestamp"],
  //   summary: List<QuestionAnswer>.from(json["summary"].map((x) => QuestionAnswer.fromJson(x))),
  // );

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      id: json['id'],
      permission: json['permission'],
      timestamp: json['timestamp'],
      summary: List<QuestionAnswer>.from(json['summary'].map((s) => QuestionAnswer.fromJson(s))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "permission": permission,
    "timestamp": timestamp,
    "summary": List<dynamic>.from(summary.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Course - \n$id\t$permission\t$timestamp\t$summary';
  }

}
