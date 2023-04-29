import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;
import 'package:faker/faker.dart';


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

      isConnected = true;
      // final body = json.decode(response.body);

      sharedPreferences.setBool("isLecturer", true);
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






  Future<String> loadData() async {

    String jsonData = '''
    {
    "0": {
        "ID": "1111",
        "name": "Computer Science",
		"groups": [
			{
				"ID": "111111",
				"courseName": "Computer Science 1",
				"lecturerID": "LuisBeagle95",
				"lectures": [
					{
						"id": "11111101",
						"permission": false,
						"timestamp": "03-05-2023",
						"summary": [
							{
								"id": "11111101QA1",
								"question": "Who is the best dog?",
								"answer": "Luis the beagle",
								"likes": 101,
								"timestamp": ""
							},
							{
								"id": "11111101QA2",
								"question": "Who is the best dog asdsadsaf?",
								"answer": "Always Luis the beagle",
								"likes": 102,
								"timestamp": ""
							},
							{
								"id": "11111101QA3",
								"question": "Who is the best dog lalalala?",
								"answer": "Forever Luis the beagle",
								"likes": 555,
								"timestamp": ""
							}
						]
					
					},
					{
						"id": "11111102",
						"permission": true,
						"timestamp": "08-05-2023",
						"summary": [
							{
								"id": "11111102QA1",
								"question": "Who is the best dog?",
								"answer": "Luis the beagle",
								"likes": 55,
								"timestamp": ""
							},
							{
								"id": "11111102QA2",
								"question": "Who is the best dog asdsadsaf?",
								"answer": "Always Luis the beagle",
								"likes": 66,
								"timestamp": ""
							},
							{
								"id": "11111102QA3",
								"question": "Who is the best dog lalalala?",
								"answer": "Forever Luis the beagle",
								"likes": 77,
								"timestamp": ""
							}
						]
					}
				]
			},
			{
				"ID": "111122",
				"courseName": "Computer Science 2",
				"lecturerID": "CharlieBrown99",
				"lectures": [
					{
						"id": "11112201",
						"permission": true,
						"timestamp": "13-05-2023",
						"summary": [
							{
								"id": "11112201QA1",
								"question": "Who is the best dog?",
								"answer": "Luis the beagle",
								"likes": 101,
								"timestamp": ""
							},
							{
								"id": "11112201QA2",
								"question": "Who is the best dog asdsadsaf?",
								"answer": "Always Luis the beagle",
								"likes": 102,
								"timestamp": ""
							}
						]
					
					},
					{
						"id": "11112202",
						"permission": true,
						"timestamp": "17-05-2023",
						"summary": [
							{
								"id": "11112202QA1",
								"question": "Who is Chalie Brown?",
								"answer": "Thats so silly question",
								"likes": 55,
								"timestamp": ""
							}
						]
					
					}
				]
			}
		]
       
    },
	
"1": {
        "ID": "2222",
        "name": "Algorithm II",
		"groups": [
			{
				"ID": "222211",
				"courseName": "Algorithm II 1",
				"lecturerID": "CharlieBrown99",
				"lectures": [
					{
						"id": "22221101",
						"permission": false,
						"timestamp": "22-05-2023",
						"summary": [
							{
								"id": "22221101QA1",
								"question": "Who is the best dog?",
								"answer": "Luis the beagle",
								"likes": 181,
								"timestamp": ""
							},
							{
								"id": "22221101QA2",
								"question": "Who is the best dog asdsadsaf?",
								"answer": "Always Luis the beagle",
								"likes": 19,
								"timestamp": ""
							}
						]
					
					},
					{
						"id": "22221102",
						"permission": true,
						"timestamp": "28-05-2023",
						"summary": [
							{
								"id": "22221102QA1",
								"question": "Who is the best dog?",
								"answer": "Luis the beagle",
								"likes": 155,
								"timestamp": ""
							},
							{
								"id": "22221102QA2",
								"question": "Who is the best dog asdsadsaf?",
								"answer": "Always Luis the beagle",
								"likes": 626,
								"timestamp": ""
							},
							{
								"id": "22221102QA3",
								"question": "Who is the best dog lalalala?",
								"answer": "Forever Luis the beagle",
								"likes": 747,
								"timestamp": ""
							}
						]
					}
				]
			}
		]
    }
    }
''';

    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));
    return jsonData;
  }








  Future<String> loadQA() async {

    final faker = Faker();
    String question = faker.lorem.sentence();
    String answer = faker.lorem.sentence();
    String time = DateFormat('HH:mm').format(DateTime.now());

    String jsonData = '''
              {
								"id": "22221102QA0",
								"question": "$question",
								"answer": "$answer",
								"likes": 0,
								"timestamp": "$time"
							}
    ''';


    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));
    return jsonData;
  }



}





String whichPlatform() {
  if (Platform.isIOS) {
    return 'http://localhost:8082/';
  } // isAndroidOS
  return 'http://10.0.2.2:8082/';
}