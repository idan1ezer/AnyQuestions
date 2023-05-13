import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../settings/app_theme.dart';
import '../my_courses/courses_page.dart';


class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPage();

}

class _StatisticsPage extends State<StatisticsPage> {

  List<int> _expandedIndexes = [];

  void _onTileClicked(int index) {
    setState(() {
      if (_expandedIndexes.contains(index)) {
        _expandedIndexes.remove(index);
      } else {
        _expandedIndexes.clear();
        _expandedIndexes.add(index);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        centerTitle: true,
        title: Text(
          "Statistics",
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
          padding: const EdgeInsets.only(top: 16.0),
          child: ListView.builder(
            itemCount: courseList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: GestureDetector(
                  onTap: () => _onTileClicked(index),
                  child: ExpansionTile(
                    // textColor: _expandedIndexes.contains(index) ? Colors.purple : Colors.blue,
                    title: Text("${courseList[index].name}"),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: courseList[index].groups.length,
                        itemBuilder: (BuildContext context, int index2) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0, right: 10),
                                child: ListTile(
                                  title: Text("Group ID - ${courseList[index].groups[index2].ID}"),
                                  subtitle: Text("Lecturer ID - ${courseList[index].groups[index2].lecturerID}"),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    context.go(
                                        context.namedLocation("statistics_list",
                                            queryParams: <String, String>{
                                              "groupID": courseList[index].groups[index2].ID
                                            })
                                    );
                                  },
                                ),
                              ),
                              if (index2 < courseList[index].groups.length - 1) Divider(
                          color: Colors.grey,
                          thickness: 1,
                          height: 20,
                          indent: 20,
                          endIndent: 20,
                          ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}