import 'package:http/http.dart' as http;

Future<bool> checkUserRegistration() async {
  const String checkRegistrationUrl = 'http://localhost:3000/user/checkUserRegistration';

  try {
    var response = await http.get(Uri.parse(checkRegistrationUrl));

    if (response.statusCode == 200) {
      // Parse the response data and determine if the user is registered
      // Replace this logic with how you handle the response from your backend
      // For example:
      // var responseData = json.decode(response.body);
      // return (responseData['userRegistered'] == true);
      return true; // Replace this with your logic
    } else {
      return false;
    }
  } catch (e) {
    print('Exception occurred: $e');
    return false;
  }
}
