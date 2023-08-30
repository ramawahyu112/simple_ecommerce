import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ecommerce/core/core.dart';

//key
String keyToken = 'TOKEN_KEY';

class Session extends GetxService {
  Future<Session> initialize() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  //Setter
  Future<bool> setToken(String value) async {
    return await prefs.setString(keyToken, value);
  }

  //Getter
  String getToken() {
    return prefs.getString(keyToken) ?? "";
  }

  Future<bool> clearSession() async {
    return await prefs.clear();
  }
}
