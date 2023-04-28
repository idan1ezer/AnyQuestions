import 'package:any_questions/settings/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../custom_widgets/my_widgets.dart';

class ClassesPage extends StatefulWidget {
  ClassesPage({Key? key, this.classID}) : super(key: key);

  String? classID;

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}


class _ClassesPageState extends State<ClassesPage> {
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
          child: ListView(
            children: <AnyQuestionsListTile>[
              AnyQuestionsListTile(title: "Lecture 1", subtitle: "20/03/2023", keyParam: "lectureID", selectedLectureID: "lec1", goToLocation: "class_summaries"),
              AnyQuestionsListTile(title: "Lecture 2", subtitle: "24/03/2023", keyParam: "lectureID", selectedLectureID: "lec2", goToLocation: "class_summaries"),
            ],
          ),
        ),

      ),
    );
  }
}