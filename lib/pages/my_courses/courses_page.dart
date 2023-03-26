import 'package:any_questions/settings/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../custom_widgets/my_widgets.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
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
          child: ListView(
            children: const <AnyQuestionsListTile>[
              AnyQuestionsListTile(
                  title: "Algebra",
                  subtitle: "Dr. Patrick",
                  keyParam: "classID",
                  selectedLectureID: "Class Algebra",
                  goToLocation: "class_lectures"),
              AnyQuestionsListTile(
                  title: "Computer Vision",
                  subtitle: "Dr. Joey",
                  keyParam: "classID",
                  selectedLectureID: "Class Computer Vision",
                  goToLocation: "class_lectures"),
            ],
          ),
        ),
      ),
    );
  }
}
