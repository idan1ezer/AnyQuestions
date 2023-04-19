import 'group.dart';

class Course {
  final String ID;
  final String name;
  final List<Group> groups;

  Course(
      {required this.ID,
        required this.name,
        required this.groups});

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    ID: json["ID"],
    name: json["name"],
    groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ID": ID,
    "name": name,
    "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Course - \n$ID\t$name\t$groups';
  }

}
