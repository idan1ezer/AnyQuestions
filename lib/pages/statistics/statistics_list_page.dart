import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../settings/app_theme.dart';



class StatisticsListPage extends StatefulWidget {
  StatisticsListPage({Key? key, this.groupID = ""}) : super(key: key);

  String? groupID;

  @override
  State<StatisticsListPage> createState() => _StatisticsListPage();

}

class _StatisticsListPage extends State<StatisticsListPage> {

  late String groupID;


  @override
  void initState() {
    super.initState();
    groupID = widget.groupID ?? "";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        centerTitle: true,
        title: Text(
          "Statistics List",
          style: AppTheme.appBarHeaderFontStyle,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Card(
                  // color: AppTheme.backgroundColor,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ListTile(
                    onTap: () {
                      context.go(
                          context.namedLocation("questions_asked",
                              queryParams: <String, String>{
                                "groupID": groupID
                              })
                      );
                    },
                    minVerticalPadding: 15,
                    title: Text(
                      "Questions Asked",
                      style: AppTheme.basicTextFontStyle,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Amount of questions / answers asked during each lecture.",
                        style: AppTheme.lightFontStyle,
                      ),
                    ),
                    trailing: Icon(Icons.question_mark),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  // color: AppTheme.backgroundColor,
                  child: ListTile(
                    onTap: () {
                      context.go(
                          context.namedLocation("time_consumed",
                              queryParams: <String, String>{
                                "groupID": groupID
                              })
                      );
                    },
                    minVerticalPadding: 15,
                    title: Text(
                      "Time consumed",
                      style: AppTheme.basicTextFontStyle,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Amount of time consumed by questions and answers during each lecture.",
                        style: AppTheme.lightFontStyle,
                      ),
                    ),
                    trailing: Icon(Icons.record_voice_over),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  // color: AppTheme.backgroundColor,
                  child: ListTile(
                    minVerticalPadding: 15,
                    title: Text(
                      "Viewers",
                      style: AppTheme.basicTextFontStyle,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Amount of the peek viewers during each live lecture.",
                        style: AppTheme.lightFontStyle,
                      ),
                    ),
                    trailing: Icon(Icons.people),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  // color: AppTheme.backgroundColor,
                  child: ListTile(
                    minVerticalPadding: 15,
                    title: Text(
                      "Top Questions",
                      style: AppTheme.basicTextFontStyle,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "List of the top questions asked during each lecture according to likes.",
                        style: AppTheme.lightFontStyle,
                      ),
                    ),
                    trailing: Icon(Icons.thumb_up),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  // color: AppTheme.backgroundColor,
                  child: ListTile(
                    minVerticalPadding: 15,
                    title: Text(
                      "Efficiency",
                      style: AppTheme.basicTextFontStyle,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Check the efficiency of each lecturer in order to determine whether the class is in the flow or not.",
                        style: AppTheme.lightFontStyle,
                      ),
                    ),
                    trailing: Icon(Icons.grade),
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