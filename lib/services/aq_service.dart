import 'dart:async';
import 'dart:convert';
import 'package:any_questions/models/question_answer.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;
import 'package:faker/faker.dart';


import '../models/course.dart';
import '../models/group.dart';
import '../models/lecture.dart';
import '../screens/login_screen.dart';


class AQService {
  String URL = whichPlatform();


  Future<void> getUser(String userName, String password) async {
    final response = await http.get(
      Uri.parse(
          '${URL}anyQuestions/users/login/${userName}/${password}'),
      headers: <String, String>{
        'Accept': "application/json; charset=UTF-8",
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      isConnected = true;
      final body = json.decode(response.body);
      var name = body["username"].split(new RegExp(r"(?<=[a-z])(?=[A-Z])"));
      String fullName = name[0] + " " + name[1];

      if (body["type"] == "LECTURER") {
        sharedPreferences.setBool("isLecturer", true);
      }
      else {
        sharedPreferences.setBool("isLecturer", false);
      }
      sharedPreferences.setString("fullUserName", body["username"]+body["password"]);
      sharedPreferences.setString("username", fullName);

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      Fluttertoast.showToast(msg: "Incorrect email or password");
      throw Exception('Failed to load User');
    }
  }


  Future<List<Course>> getCourses(String userName) async {
    final response = await http.get(
      Uri.parse(
          '${URL}anyQuestions/courses/${userName}'),
      headers: <String, String>{
        'Accept': "application/json; charset=UTF-8",
        // 'Cookie': "application/json; charset=UTF-8",
      },
    );

    if (response.statusCode == 200) {

      List<Course> courses = List<Course>.from(jsonDecode(response.body).map((course) => Course.fromJson(course)));

      // print(courses[0].groups[0].lectures[0].id);


      return courses;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      throw Exception('Failed to load courses');
    }
  }



  Future<List<QuestionAnswer>> loadLectureQA(String lectureID) async {


    final response = await http.get(
      Uri.parse(
          '${URL}anyQuestions/live/getQA/${lectureID}'),
      headers: <String, String>{
        'Accept': "application/json; charset=UTF-8",
        // 'Cookie': "application/json; charset=UTF-8",
      },
    );


    if (response.statusCode == 200) {

      List<QuestionAnswer> summary = List<QuestionAnswer>.from(jsonDecode(response.body).map((qa) => QuestionAnswer.fromJson(qa)));

      return summary;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      throw Exception('Failed to load summary');
    }
  }



}





String whichPlatform() {
  if (Platform.isIOS) {
    return 'http://localhost:8082/';
  } // isAndroidOS
  return 'http://10.0.2.2:8082/';
}