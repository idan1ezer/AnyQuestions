import 'dart:async';
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
bool isLoading = true;

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}



class _CoursesPageState extends State<CoursesPage> {

  AQService aqService = AQService();
  late final bool isLecturer;

  Stream<List<Course>> getCoursesStream() async* {
    courseList = await aqService.getCourses(sharedPreferences.getString("fullUserName")!);
    yield courseList;
  }
  final StreamController<List<Course>> _coursesController = StreamController<List<Course>>();



  @override
  void initState() {
    super.initState();
    courseList.clear();
    _loadCourses();

    isLecturer = sharedPreferences.getBool("isLecturer") ?? false;

  }

  void _loadCourses() {
    getCoursesStream().listen((courses) {
      // setState(() {
      //   courseList = courses;
      // });
      _coursesController.add(courses);
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _coursesController.close();
    super.dispose();
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
          child: StreamBuilder<List<Course>>(
            stream: _coursesController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final courseList = snapshot.data!;
                return ListView.builder(
                  itemCount: courseList.length,
                  itemBuilder: (context, index) {
                    return AnyQuestionsCourseListTile(
                      title: courseList[index].name,
                      subtitle: isLecturer ? sharedPreferences.getString("username") ?? "Lecturer" : courseList[index].groups[0].lecturerID,
                      keyParam: "groupID",
                      valueParam: courseList[index].groups[0].id,
                      goToLocation: "class_lectures",
                      groupsID: isLecturer ? getGroupsID(courseList[index].groups) : [],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error loading courses: ${snapshot.error}');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  List<String> getGroupsID(List<Group> groups) {
    List<String> groupIDList = [];

    for (Group group in groups) {
      groupIDList.add(group.id);
    }
    return groupIDList;
  }
}
