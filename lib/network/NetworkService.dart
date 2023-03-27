import 'dart:convert';

import '../models/User.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  static Future<String?> login(
      String role, String mobileNumber, String password) async {
    await Future.delayed(Duration(seconds: 5));
    return "login success";
  }

  static Future<String?> registerUser(User user) async {
    await Future.delayed(Duration(seconds: 5));
    return "register success";
  }

  static Future<String?> registerUsersd(User user) async {
    await http.get(Uri.parse("uri")).then((result) {
      if (result.statusCode == 200) {
        return result.body;
      } else {
        throw Exception(result.body);
      }
    });
  }

  static Future<String?> registerUsers() async {
    await http
        .post(Uri.parse("http://10.0.2.2:5001/v1/user/CreateUser"),
            body: jsonEncode(<String, String>{
              "userName": "Mukesh",
              "roleId": "641f223df58a0b3ae46351e0",
              "password": "Mukesh@123",
              "email": "mukesh",
              "mobileNumber": "9104674394"
            }))
        .then((value) {
      print(value.body.toString());
    });
  }
}
