import 'dart:convert';

import 'package:any_questions/models/group.dart';
import 'package:any_questions/screens/home_screen.dart';
import 'package:any_questions/services/aq_service.dart';
import 'package:any_questions/settings/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../custom_widgets/my_widgets.dart';
import '../../models/course.dart';
import '../../screens/login_screen.dart';


List<Course> courseList = [];

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}



class _CoursesPageState extends State<CoursesPage> {

  AQService aqService = AQService();
  late final bool isLecturer;

  @override
  void initState() {
    super.initState();

    isLecturer = sharedPreferences.getBool("isLecturer") ?? false;

    aqService.loadData().then((jsonString) {
      final Map<String, dynamic> courseMap = json.decode(jsonString);
      setState(() {
        courseMap.forEach((key, value) {
          Course newCourse = Course.fromJson(value);
          courseList.insert(0, newCourse);
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        centerTitle: true,
        title: Text(
          "My Courses",
          style: AppTheme.appBarHeaderFontStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.go('/');
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
            itemCount: courseList.length,
            itemBuilder: (context, index) {
              return AnyQuestionsCourseListTile(
                title: courseList[index].name,
                subtitle: isLecturer ? "LECTURER THAT LOGGED IN NAME" : courseList[index].groups[0].lecturerID,
                keyParam: "groupID",
                valueParam: courseList[index].groups[0].ID,
                goToLocation: "class_lectures",
                groupsID: isLecturer ? getGroupsID(courseList[index].groups) : [],
              );
            },
          ),
        ),
      ),
    );
  }

  List<String> getGroupsID(List<Group> groups) {
    List<String> groupIDList = [];

    for (Group group in groups) {
      groupIDList.add(group.ID);
    }
    return groupIDList;
  }
}
