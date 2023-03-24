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
      body: Container(
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
        ),
        child: Text("Summary")

      ),
    );
  }
}