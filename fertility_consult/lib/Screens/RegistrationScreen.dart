import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatelessWidget {
  // Replace with your local server URL
  final String serverUrl = 'http://localhost:3000/user/register';

  Future<void> _registerUser(String name, String email, String password) async {
  try {
    // Prepare registration data
    Map<String, String> registrationData = {
      'name': name,
      'email': email,
      'password': password,
    };

    // Send a POST request to the local server
    var response = await http.post(
      Uri.parse(serverUrl),
      body: registrationData,
    );

    if (response.statusCode == 200) {
      // Registration successful
      print('Registration successful: ${response.body}');
      // Add logic here for success scenario (e.g., navigate to next screen)
    } else {
      // Registration failed
      print('Registration failed: ${response.statusCode}');
      // Add logic here for failure scenario
    }
  } catch (e) {
    // Exception occurred during registration
    print('Exception during registration: $e');
    // Add logic to handle exceptions
  }
  }

  @override
  Widget build(BuildContext context) {
    String name = ''; // Store name entered by user
    String email = ''; // Store email entered by user
    String password = ''; // Store password entered by user

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: (value) => name = value,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              onChanged: (value) => email = value,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              onChanged: (value) => password = value,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _registerUser(name, email, password);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
