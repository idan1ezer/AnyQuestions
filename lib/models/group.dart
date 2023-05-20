import 'lecture.dart';

class Group {
  final String id;
  final String lecturerID;
  final List<Lecture> lectures;

  Group(
      {required this.id,
      required this.lecturerID,
      required this.lectures});

  // factory Group.fromJson(Map<String, dynamic> json) => Group(
  //   id: json["id"],
  //   lecturerID: json["lecturerID"],
  //   lectures: List<Lecture>.from(json["lectures"].map((x) => Lecture.fromJson(x))),
  // );

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json["id"],
      lecturerID: json["lecturerID"],
      lectures: List<Lecture>.from(json['lectures'].map((lecture) => Lecture.fromJson(lecture))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "lecturerID": lecturerID,
    "lectures": List<dynamic>.from(lectures.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Course - \n$id\t$lecturerID\t$lectures';
  }

}
