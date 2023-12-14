import 'package:http/http.dart' as http;

Future<bool> checkUserRegistration() async {
  const String checkRegistrationUrl = 'http://localhost:3000/user/checkUserRegistration';

  try {
    var response = await http.get(Uri.parse(checkRegistrationUrl));

    if (response.statusCode == 200) {
      return true; 
    } else {
      return false;
    }
  } catch (e) {
    print('Exception occurred: $e');
    return false;
  }
}
