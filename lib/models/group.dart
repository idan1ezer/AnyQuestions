import 'lecture.dart';

class Group {
  final String ID;
  final String courseName;
  final String lecturerID;
  final List<Lecture> lectures;

  Group(
      {required this.ID,
      required this.courseName,
      required this.lecturerID,
      required this.lectures});

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    ID: json["ID"],
    courseName: json["courseName"],
    lecturerID: json["lecturerID"],
    lectures: List<Lecture>.from(json["lectures"].map((x) => Lecture.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ID": ID,
    "courseName": courseName,
    "lecturerID": lecturerID,
    "lectures": List<dynamic>.from(lectures.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Course - \n$ID\t$courseName\t$lecturerID\t$lectures';
  }

}
