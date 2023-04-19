import 'package:any_questions/custom_widgets/my_widgets.dart';
import 'package:any_questions/settings/app_theme.dart';
import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  SummaryPage({Key? key, this.lectureID}) : super(key: key);

  String? lectureID;

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
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
                child: ListView(
                  children: <QuestionAnswerCard> [
                    QuestionAnswerCard(question: "Who is the best dog?", answer: "Luis the beagle! \nThe one and only \nI know...",),
                    QuestionAnswerCard(question: "Who is lalala?", answer: "Luis the beagle! \nThe one and only \nI know...",),
                    QuestionAnswerCard(question: "Who is lalala?", answer: "Luis the beagle! \nThe one and only \nI know...",),
                    QuestionAnswerCard(question: "Who is lalala?", answer: "Luis the beagle! \nThe one and only \nI know...",),
                    QuestionAnswerCard(question: "Who is lalala?", answer: "Luis the beagle! \nThe one and only \nI know...",),
                    QuestionAnswerCard(question: "Who is lalala?", answer: "Luis the beagle! \nThe one and only \nI know...",),
                  ],
                ),
              ),
            ),
          ),
          const Flexible(
            flex: 1,
              child: Text("Download")
          )
        ],
      ),
    );
  }
}
