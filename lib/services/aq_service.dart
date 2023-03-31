import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

import '../screens/login_screen.dart';


class AQService {
  String URL = whichPlatform();








  Future<void> getUser(String userName, String password) async {
    final response = await http.get(
      Uri.parse(
          '${URL}anyquestions/users/login/${userName}/${password}'),
      headers: <String, String>{
        'Accept': "application/json; charset=UTF-8",
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      isConnected = true;
      final body = json.decode(response.body);

      if (body["role"] == "STUDENT") {
        role = "STUDENT";
      } else {
        role = "LECTURER";
      }

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      Fluttertoast.showToast(msg: "Incorrect email or password");
      throw Exception('Failed to load User');
    }
  }





}





String whichPlatform() {
  if (Platform.isIOS) {
    return 'http://localhost:8085/';
  } // isAndroidOS
  return 'http://10.0.2.2:8085/';
}