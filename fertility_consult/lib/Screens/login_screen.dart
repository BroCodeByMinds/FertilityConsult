
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fertility_consult/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; 

class LoginScreen extends StatelessWidget {
  final String loginUrl = 'http://localhost:3000/user/checkUserRegistration';

  const LoginScreen({Key? key}) : super(key: key);

  Future<void> _loginUser(String email, String password, BuildContext context) async {
    try {
      Map<String, String> loginData = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse(loginUrl),
        body: loginData,
      );

      if (response.statusCode == 200) {
        // Parse the response body as a Map
        Map<String, dynamic> responseBody = json.decode(response.body);

        // Extract user details from the response
        String username = responseBody['username'];
        String email = responseBody['email'];
        String token = responseBody['token'];

        // Store user details locally using SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', username);
        prefs.setString('email', email);
        prefs.setString('token', token);

        // Show the success dialog and navigate to the home screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Login Successful'),
              content: const Text('You have successfully logged in.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()), // Navigate to HomeScreen after successful login
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Login failed
        print('Login failed: ${response.statusCode}');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Login Failed'),
              content: const Text('Invalid email or password. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Exception occurred during login
      print('Exception during login: $e');
      // Handle exceptions
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: (value) => email = value,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              onChanged: (value) => password = value,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _loginUser(email, password, context);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
