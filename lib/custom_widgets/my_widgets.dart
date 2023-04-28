import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../settings/app_theme.dart';

class QuestionAnswerCard extends StatelessWidget {
  QuestionAnswerCard({Key? key, required this.question, required this.answer, this.isLecturer = true}) : super(key: key);

  final String question;
  final String answer;
  final bool isLecturer;
  final textFormKey = GlobalKey<FormState>();
  final TextEditingController textQuestionCtrl = TextEditingController();
  final TextEditingController textAnswerCtrl = TextEditingController();

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
                        TextButton(
                          onPressed: () async {
                              // int isTextChanged = await http.updateQA(textQuestionCtrl.text, textAnswerCtrl.text);
                              // if (isTextChanged == 200) {
                              //   textQuestionCtrl.clear();
                              //   textAnswerCtrl.clear();
                              //   Navigator.pop(context);
                              // }
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
                        ),
                        TextButton(
                          onPressed: () {
                            textQuestionCtrl.clear();
                            textAnswerCtrl.clear();
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
}




class AnyQuestionsListTile extends StatelessWidget {
  const AnyQuestionsListTile({Key? key, required this.title, required this.subtitle, required this.keyParam, required this.selectedLectureID, required this.goToLocation, this.isLecturer = true}) : super(key: key);

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
  const AnyQuestionsCourseListTile({Key? key, required this.title, required this.subtitle, required this.keyParam, required this.selectedLectureID, required this.goToLocation, this.isLecturer = true}) : super(key: key);

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
                  context.go(
                      context.namedLocation(goToLocation,
                          queryParams: <String, String>{
                            keyParam: selectedLectureID
                          })
                  );
                  // handle menu item selection
                },
                // IS_LECTURER NEED TO BE DIFF CUZ IT APPEARS ON BOTH COURSES AND LECTURES INSTEAD OF JUST COURSES
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
