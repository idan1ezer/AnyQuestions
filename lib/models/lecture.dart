import 'package:any_questions/models/question_answer.dart';

class Lecture {
  final String ID;
  final bool permission;
  final String timestamp;
  final List<QuestionAnswer> summary;

  Lecture(
      {required this.ID,
      required this.permission,
      required this.timestamp,
      required this.summary});


  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
    ID: json["ID"],
    permission: json["permission"],
    timestamp: json["timestamp"],
    summary: List<QuestionAnswer>.from(json["summary"].map((x) => QuestionAnswer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ID": ID,
    "permission": permission,
    "timestamp": timestamp,
    "summary": List<dynamic>.from(summary.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Course - \n$ID\t$permission\t$timestamp\t$summary';
  }

}
