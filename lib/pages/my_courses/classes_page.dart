import 'package:any_questions/settings/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                child: Card(
                  child: ListTile(
                    title: Text(
                      "Lecture 1",
                      style: AppTheme.basicTextFontStyle,
                    ),
                    subtitle: Text(
                      "20/03/2023",
                      style: AppTheme.lightFontStyle,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // String selectedLectureID = snapshot.data![index].chatId;
                      String selectedLectureID = "lecture 1";
                      return context.go(
                        context.namedLocation('class_summaries',
                            queryParams: <String, String>{
                              'lectureID': selectedLectureID
                            }),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                child: Card(
                  child: ListTile(
                    title: Text(
                      "Lecture 2",
                      style: AppTheme.basicTextFontStyle,
                    ),
                    subtitle: Text(
                      "24/03/2023",
                      style: AppTheme.lightFontStyle,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {print("ListTile tapped");},
                  ),
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}