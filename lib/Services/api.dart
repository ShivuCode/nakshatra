import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nakshatra/Services/database.dart';

class ApiService {
  static Future<bool> registeration() async {
    final Map<String, String> data = {
      "username": "shivangi",
      "mobile": "9898341345",
      "age": "19",
      "gender": "1",
      "state": "Daman&Diu",
      "city": "Daman",
      "email": "shivangi@gmail.com",
      "password": "09876"
    };
    final response = await http.post(
      Uri.parse("http://localhost:5013/nakshatra/Registration"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      if (kDebugMode) {
        print(response.body);
      }
      return false;
    }
  }

  //login
  static Future<bool> login(username, password) async {
    final response = await http.post(
      Uri.parse("http://localhost:5013/nakshatra/Registration/Login"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"username": username, "password": password}),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      String token = json['token'];
      DbHelper.setToken(token);

      return true;
    } else {
      if (kDebugMode) {
        print(response.body);
      }
      return false;
    }
  }

  //get all data from database
  static Future<List<dynamic>> fetchMovies() async {
    String token = await DbHelper.getToken();
    print(token);
    final response = await http
        .get(Uri.parse("http://localhost:5013/nakshatra/Movie"), headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return json;
    } else {
      if (kDebugMode) {
        print(response.body);
      }
      return [];
    }
  }
}
