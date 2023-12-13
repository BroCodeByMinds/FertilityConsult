import 'package:shared_preferences/shared_preferences.dart';

class RegistrationHelper {
  static Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedEmail = prefs.getString('email');
    String? storedToken = prefs.getString('token');

    bool isLoggedIn = storedUsername != null &&
        storedUsername.isNotEmpty &&
        storedEmail != null &&
        storedEmail.isNotEmpty &&
        storedToken != null &&
        storedToken.isNotEmpty;

    return isLoggedIn;
  }
}