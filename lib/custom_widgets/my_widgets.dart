import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../settings/app_theme.dart';

class QuestionAnswerCard extends StatelessWidget {
  const QuestionAnswerCard({Key? key, required this.question, required this.answer}) : super(key: key);

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        color: AppTheme.summaryQAColor,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Question:\n$question",
                  style: AppTheme.lightFontStyle,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Answer:\n${answer}",
                  style: AppTheme.lightFontStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class AnyQuestionsListTile extends StatelessWidget {
  const AnyQuestionsListTile({Key? key, required this.title, required this.subtitle, required this.keyParam, required this.selectedLectureID, required this.goToLocation}) : super(key: key);

  final String title;
  final String subtitle;
  final String keyParam;
  final String selectedLectureID;
  final String goToLocation;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
      child: Card(
        child: ListTile(
          title: Text(
            title,
            style: AppTheme.basicTextFontStyle,
          ),
          subtitle: Text(
            subtitle,
            style: AppTheme.lightFontStyle,
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {


            context.go(
              context.namedLocation(goToLocation,
                  queryParams: <String, String>{
                    keyParam: selectedLectureID
                  })
            );
          },
        ),
      ),
    );
  }
}



