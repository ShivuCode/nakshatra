import 'package:shared_preferences/shared_preferences.dart';

class DbHelper {
  static setToken(token) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString('token', token);
  }

  static void setId(id) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString('roleId', id);
  }

  static getToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String token = sf.getString('token') ?? '';
    return token;
  }

  getId() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String id = sf.getString('roleId') ?? '';
    return id;
  }
}
