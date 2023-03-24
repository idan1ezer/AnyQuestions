import 'package:any_questions/settings/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


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
                      "Algebra",
                      style: AppTheme.basicTextFontStyle,
                    ),
                    subtitle: Text(
                      "Dr. Patrick",
                      style: AppTheme.lightFontStyle,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // String selectedClassID = snapshot.data![index].chatId;
                      String selectedClassID = "class Algebra";
                      return context.go(
                        context.namedLocation('class_lectures',
                            queryParams: <String, String>{
                              'classID': selectedClassID
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
                      "Computer Vision",
                      style: AppTheme.basicTextFontStyle,
                    ),
                    subtitle: Text(
                      "Dr. Joey",
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


        // child: Column(
        //   children: <Widget>[
            // Expanded(
            //   child: FutureBuilder<List<Course>>(
            //     future: futureCourse,
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Scaffold(
            //           body: Center(
            //             child: Lottie.asset('lottie/dana_lottie.json'),
            //           ),
            //         );
            //       }
            //
            //       if (snapshot.hasError) {
            //         return Text('Error: ${snapshot.error}');
            //       }
            //
            //       if (snapshot.data == null) {
            //         return const CircularProgressIndicator();
            //       }
            //       return ListView.builder(
            //         reverse: false,
            //         padding: const EdgeInsets.only(top: 15),
            //         itemCount: snapshot.data!.length,
            //         itemBuilder: (context, index) {
            //           String time = (snapshot.data!)[index].date;
            //           String hour = (snapshot.data!)[index].conversation[0].time;
            //           time = "${time.substring(8,10)}/${time.substring(5,7)}/${time.substring(0,4)}";
            //           final String messageToShow = snapshot.data![index].title;
            //           return GestureDetector(
            //             onTap: () {
            //               String selectedChatId = snapshot.data![index].chatId;
            //               return context.go(
            //                 context.namedLocation('read_chat',
            //                     queryParams: <String, String>{
            //                       'chatHistoryID': selectedChatId
            //                     }),
            //               );
            //             },
            //             child: Card(
            //               color: Colors.purple[50],
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                   children: [
            //                     Flexible(
            //                       flex: 2,
            //                       child: Align(
            //                         alignment: Alignment.center,
            //                         child: Text(
            //                           messageToShow,
            //                           style: GoogleFonts.varelaRound(
            //                             textStyle: const TextStyle(
            //                                 color: Colors.black,
            //                                 fontWeight: FontWeight.normal,
            //                                 fontSize: 14),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     Flexible(
            //                       flex: 1,
            //                       child: Align(
            //                         alignment: Alignment.center,
            //                         child: Text(
            //                           hour,
            //                           style: GoogleFonts.varelaRound(
            //                             textStyle: const TextStyle(
            //                                 color: Colors.black,
            //                                 fontWeight: FontWeight.normal,
            //                                 fontSize: 14),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     Flexible(
            //                       flex: 1,
            //                       child: Align(
            //                         alignment: Alignment.centerRight,
            //                         child: Text(
            //                           time,
            //                           textAlign: TextAlign.right,
            //                           style: GoogleFonts.varelaRound(
            //                             textStyle: const TextStyle(
            //                                 color: Colors.black,
            //                                 fontWeight: FontWeight.normal,
            //                                 fontSize: 14),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
        //   ],
        // ),
      ),
    );
  }
}