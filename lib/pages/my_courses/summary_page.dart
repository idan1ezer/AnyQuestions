import 'package:any_questions/custom_widgets/my_widgets.dart';
import 'package:any_questions/settings/app_theme.dart';
import 'package:flutter/material.dart';

import '../../models/question_answer.dart';
import 'courses_page.dart';

class SummaryPage extends StatefulWidget {
  SummaryPage({Key? key, this.lectureID}) : super(key: key);

  String? lectureID;

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {

  late String lectureID;
  late String groupID;
  late String courseID;
  late List<QuestionAnswer> qaList;

  @override
  void initState() {
    super.initState();
    lectureID = widget.lectureID ?? "";
    courseID = lectureID.isNotEmpty ? lectureID.substring(0,4) : "";
    groupID = lectureID.isNotEmpty ? lectureID.substring(0,6) : "";

    qaList = courseList.firstWhere((course) => course.ID == courseID).groups.firstWhere((group) => group.ID == groupID).lectures.firstWhere((lecture) => lecture.id == lectureID).summary;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        centerTitle: true,
        title: Text(
          "Summary",
          style: AppTheme.appBarHeaderFontStyle,
        ),
        actions: [
          IconButton(onPressed: () {

          },
              icon: const Icon(Icons.download)
            ,)
        ],
      ),
      body: Column(
        children: [
          Flexible(
            flex: 10,
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.builder(
                  itemCount: qaList.length,
                  itemBuilder: (context, index) {
                    return QuestionAnswerCard(
                      question: qaList[index].question,
                      answer: qaList[index].answer,
                    );
                  },
                ),
              ),
            ),
          ),
          // const Flexible(
          //   flex: 1,
          //     child: Text("Download")
          // )
        ],
      ),
    );
  }
}
