import 'package:any_questions/services/aq_service.dart';
import 'package:any_questions/settings/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_widgets/my_widgets.dart';


bool isConnected = false;
// String role = "LECTURER";
late SharedPreferences sharedPreferences;


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AQService http = AQService();
  final userNameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  Future<bool> showExitPopup() async {
    return await showDialog(
      //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) =>
      const ExitAppAlertDialog(title: 'Exit App', content: 'Are you sure you want to close AnyQuestions?'),
    ) ??
        false;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppTheme.appBarColor,
          centerTitle: true,
          // title: Text(
          //   "Login",
          //   style: AppTheme.appBarHeaderFontStyle
          // ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Image.asset('images/anyQuestions.png'),
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: userNameCtrl,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      style: AppTheme.basicTextFontStyle,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.person_fill),
                        border: InputBorder.none,
                        hintText: "Username",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: passwordCtrl,
                      textAlign: TextAlign.left,
                      obscureText: true,
                      style: AppTheme.basicTextFontStyle,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.lock_fill),
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await login(userNameCtrl.text, passwordCtrl.text);
                    // Navigator.of(context).pop();
                    // context.go('/home_screen');
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.mainColor),
                  child: Text(
                    "Login",
                    style: AppTheme.buttonFontStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }





  Future<void> login(String userNameCtrl, String passwordCtrl) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    try {
      await http.getUser(userNameCtrl, passwordCtrl);
    } catch (err) {
      Navigator.of(context).pop();
    }

    if (isConnected) {
      Fluttertoast.showToast(msg: "Logged in successfully!");
      // Navigator.of(context).pop();
      return context.go(
        context.namedLocation('home',)
      );
    }
  }


}