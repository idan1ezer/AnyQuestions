import 'package:any_questions/pages/my_courses/courses_page.dart';
import 'package:any_questions/settings/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../custom_widgets/my_widgets.dart';
import '../../models/lecture.dart';

class ClassesPage extends StatefulWidget {
  ClassesPage({Key? key, this.groupID = ""}) : super(key: key);

  String? groupID;

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}


class _ClassesPageState extends State<ClassesPage> {

  late String groupID;
  late String courseID;
  late List<Lecture> lecturesList;

  @override
  void initState() {
    super.initState();
    groupID = widget.groupID ?? "";
    courseID = groupID.isNotEmpty ? groupID.substring(0,4) : "";

    lecturesList = courseList.firstWhere((course) => course.ID == courseID).groups.firstWhere((group) => group.ID == groupID).lectures;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        centerTitle: true,
        title: Text(
          "X Class",
          style: AppTheme.appBarHeaderFontStyle,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
              itemCount: lecturesList.length,
              itemBuilder: (context, index) {
                return AnyQuestionsListTile(
                  title: "Lecture $index",
                  subtitle: lecturesList[index].timestamp,
                  keyParam: "lectureID",
                  selectedLectureID: lecturesList[index].id,
                  goToLocation: "class_summaries",
                );
              },
          ),
        ),

      ),
    );
  }
}