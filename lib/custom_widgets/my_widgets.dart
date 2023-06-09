import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/login_screen.dart';
import '../settings/app_theme.dart';

class QuestionAnswerCard extends StatefulWidget {
  QuestionAnswerCard({Key? key, required this.question, required this.answer})
      : super(key: key);

  final String question;
  final String answer;

  @override
  State<QuestionAnswerCard> createState() => _QuestionAnswerCard();

}

class _QuestionAnswerCard extends State<QuestionAnswerCard> {

  late String question;
  late String answer;
  final bool isLecturer = sharedPreferences.getBool("isLecturer") ?? false;
  final textFormKey = GlobalKey<FormState>();
  final TextEditingController textQuestionCtrl = TextEditingController();
  final TextEditingController textAnswerCtrl = TextEditingController();
  late String tempQuestion;
  late String tempAnswer;

  @override
  void initState() {
    super.initState();

    question = widget.question;
    answer = widget.answer;
    tempQuestion = question;
    tempAnswer = answer;
  }

  @override
  void dispose() {
    textQuestionCtrl.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    textQuestionCtrl.text = question;
    textAnswerCtrl.text = answer;

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
            Container(
              child: isLecturer ? Positioned(
                top: 0,
                right: 2,
                child: IconButton(
                  icon: Icon(Icons.edit, size: 18,),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      scrollable: true,
                      title: Text(
                        'Edit Text',
                        style: AppTheme.dialogTitleFontStyle,
                        ),
                      content: Column(
                        children: [
                          Text(
                            'Here you can edit the Q&A',
                            style: AppTheme.basicTextFontStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Form(
                            key: textFormKey,
                            child: Column(
                              children: [
                                Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextFormField(
                                  // textDirection: TextDirection.rtl,
                                  controller: textQuestionCtrl,
                                  // onChanged: (text) {
                                  //   // tempQuestion = text;
                                  //   // textQuestionCtrl.text = text;
                                  //   updateQAText(text, true);
                                  // },
                                  // onChanged: _onQuestionTextFieldUpdated,
                                  maxLines: 8,
                                  decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    border: InputBorder.none,
                                    hintText: "Question",
                                    hintStyle: AppTheme.lightFontStyle,
                                  ),
                                ),
                          ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextFormField(
                                    // textDirection: TextDirection.rtl,
                                    controller: textAnswerCtrl,
                                    // onChanged: (text) {
                                    //   // tempAnswer = text;
                                    //   // textAnswerCtrl.text = text;
                                    //   updateQAText(text, true);
                                    // },
                                    // onChanged: _onAnswerTextFieldUpdated,
                                    maxLines: 8,
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      border: InputBorder.none,
                                      hintText: "Answer",
                                      hintStyle: AppTheme.lightFontStyle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      actions: <Widget>[
                        ApplyTextButton(),
                        TextButton(
                          onPressed: () {
                            // textQuestionCtrl.clear();
                            // textAnswerCtrl.clear();
                            Navigator.pop(context, 'Cancel');
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: AppTheme.mainColor)
                                  )
                              )
                          ),
                          child: Text(
                            'Cancel',
                            style: AppTheme.buttonFontStyle,
                          ),
                        ),
                      ],
                      // actionsAlignment: MainAxisAlignment.start,
                    ),
                  ),
                ),
              ) : null,
            ),
          ],
        )

      ),
    );
  }


  Widget ApplyTextButton() {
    return TextButton(
      onPressed: () async {
        if (question != textQuestionCtrl.text) {
          setState(() {
            question = textQuestionCtrl.text;
          });
        }
        if (tempAnswer != textAnswerCtrl.text) {
          setState(() {
            answer = textAnswerCtrl.text;
          });
        }

        Navigator.pop(context, 'Apply');
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: AppTheme.mainColor)
              )
          )
      ),
      child: Text(
        'Apply',
        style: AppTheme.buttonFontStyle,
      ),
    );
  }



}




class AnyQuestionsListTile extends StatelessWidget {
  AnyQuestionsListTile({Key? key, required this.title, required this.subtitle, required this.keyParam, required this.selectedLectureID, required this.goToLocation}) : super(key: key);

  final bool isLecturer = sharedPreferences.getBool("isLecturer") ?? false;
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
          trailing: IconButton(onPressed: () {
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


class AnyQuestionsCourseListTile extends StatelessWidget {
  AnyQuestionsCourseListTile({Key? key, required this.title, required this.subtitle, required this.keyParam, required this.valueParam, required this.goToLocation, required this.groupsID}) : super(key: key);

  final bool isLecturer = sharedPreferences.getBool("isLecturer") ?? false;
  final String title;
  final String subtitle;
  final String keyParam;
  final String valueParam;
  final String goToLocation;
  final List<String> groupsID;

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
                  context.go(
                      context.namedLocation(goToLocation,
                          queryParams: <String, String>{
                            keyParam: value
                          })
                  );
                  // handle menu item selection
                },
                // IS_LECTURER NEED TO BE DIFF CUZ IT APPEARS ON BOTH COURSES AND LECTURES INSTEAD OF JUST COURSES
                itemBuilder: (BuildContext context) {
                  return groupsID.map((String group) {
                    return PopupMenuItem<String>(
                      value: group,
                        child: Text(group),
                    );
                  }).toList();
                },
              ),
            ],
          ) :
          IconButton(onPressed: () {
            context.go(
                context.namedLocation(goToLocation,
                    queryParams: <String, String>{
                      keyParam: valueParam
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
