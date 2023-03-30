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
        child: Stack(
          children: [
            Column(
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
            Positioned(
              top: 0,
              right: 2,
              child: IconButton(
                icon: Icon(Icons.edit, size: 18,),
                onPressed: () {
                  // handle edit button press
                },
              ),
            ),
          ],
        )

      ),
    );
  }
}




class AnyQuestionsListTile extends StatelessWidget {
  const AnyQuestionsListTile({Key? key, required this.title, required this.subtitle, required this.keyParam, required this.selectedLectureID, required this.goToLocation, this.isLecturer = false}) : super(key: key);

  final bool isLecturer;
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
          trailing: isLecturer ?
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              PopupMenuButton<String>(
                icon: Icon(Icons.arrow_forward_ios),
                onSelected: (String value) {
                  // handle menu item selection
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Edit',
                    child: Text('Group 1'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Delete',
                    child: Text('Group 2'),
                  ),
                ],
              ),
            ],
          ) :
              IconButton(onPressed: () {
                  context.go(
                    context.namedLocation(goToLocation,
                        queryParams: <String, String>{
                          keyParam: selectedLectureID
                        })
                  );
              }, icon: Icon(Icons.arrow_forward_ios)),
          // onTap: () {
          //   // print(isLecturer);
          //   // isLecturer ? PopUpMen(menuList: [],) :
          //
          //
          //   context.go(
          //     context.namedLocation(goToLocation,
          //         queryParams: <String, String>{
          //           keyParam: selectedLectureID
          //         })
          //   );
          // },
        ),
      ),
    );
  }
}




class PopUpMen extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const PopUpMen({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // initialValue: selectedMenu,
      // Callback that sets the selected popup menu item.
      // onSelected: (SampleItem item) {
      //   setState(() {
      //     selectedMenu = item;
      //   });
      // },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          child: Text('Item 1'),
        ),
        const PopupMenuItem(
          child: Text('Item 2'),
        ),
      ],
    );
  }
}



class DialogTextButton extends StatelessWidget {
  const DialogTextButton({Key? key, required this.text, required this.style, required this.borderColor, required this.isTrue}) : super(key: key);

  final String text;
  final TextStyle style;
  final Color borderColor;
  final bool isTrue;

  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: () => Navigator.of(context).pop(isTrue),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: borderColor)
              )
          )
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}





class ExitAppAlertDialog extends StatelessWidget {
  const ExitAppAlertDialog({Key? key, required this.title, required this.content}) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      title: Text(title,
        style: AppTheme.dialogTitleFontStyle,),
      content: Text(
        content,
        style: AppTheme.basicTextFontStyle,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(16.0))),
      actions: [
        DialogTextButton(text: 'No', style: AppTheme.basicTextFontStyle, borderColor: AppTheme.secondColor, isTrue: false,),
        DialogTextButton(text: 'Yes', style: AppTheme.basicTextFontStyle, borderColor: AppTheme.secondColor, isTrue: true,),
      ],
    );
  }
}
