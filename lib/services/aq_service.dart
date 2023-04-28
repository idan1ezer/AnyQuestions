import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

import '../models/course.dart';
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

      print(response.statusCode.runtimeType);
      isConnected = true;
      // final body = json.decode(response.body);

      print("here");
      sharedPreferences.setBool("isLecturer", false);
      // print("body:" + body);
      // if (body["role"] == "STUDENT") {
      //   // sharedPreferences.setBool("isLecturer", false);
      //   sharedPreferences.setBool("isLecturer", true);
      // } else {
      //   sharedPreferences.setBool("isLecturer", true);
      // }

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
          '${URL}anyquestions/courses/currentCoursesInstances/${userName}'),
      headers: <String, String>{
        'Accept': "application/json; charset=UTF-8",
        // 'Cookie': "application/json; charset=UTF-8",
      },
    );

    if (response.statusCode == 200) {
      List<Course> courseList = [];

      Map<String, dynamic> courseMap = jsonDecode(response.body);

      courseMap.forEach((key, value) {
        Course newCourse = Course.fromJson(value);
        courseList.insert(0, newCourse);
      });

      return courseList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      throw Exception('Failed to load courses');
    }
  }






}





String whichPlatform() {
  if (Platform.isIOS) {
    return 'http://localhost:8082/';
  } // isAndroidOS
  return 'http://10.0.2.2:8082/';
}