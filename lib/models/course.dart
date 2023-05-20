import 'group.dart';

class Course {
  final String id;
  final String name;
  final List<Group> groups;

  Course(
      {required this.id,
        required this.name,
        required this.groups});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      groups: List<Group>.from(json['groups'].map((group) => Group.fromJson(group))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Course - \n$id\t$name\t$groups';
  }

}
