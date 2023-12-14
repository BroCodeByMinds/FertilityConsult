import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fertility_consult/Screens/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  final String serverUrl = 'http://localhost:3000/user/register';

  const RegistrationScreen({Key? key}) : super(key: key);

  Future<void> _registerUser(String name, String email, String password, BuildContext context) async {
    try {
      Map<String, String> registrationData = {
        'name': name,
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse(serverUrl),
        body: registrationData,
      );

      if (response.statusCode == 200) {
        // Registration successful
        print('Registration successful: ${response.body}');
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Registration Successful'),
              content: const Text('You have successfully registered.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigate to LoginScreen after successful registration
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Registration failed
        print('Registration failed: ${response.statusCode}');
        // Handle registration failure
      }
    } catch (e) {
      // Exception occurred during registration
      print('Exception during registration: $e');
      // Handle exceptions
    }
  }

  Future<void> _loginUser(String email, String password, BuildContext context) async {
    // Your login code remains unchanged, reuse the existing _loginUser function
  }

  @override
  Widget build(BuildContext context) {
    String name = '';
    String email = '';
    String password = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration / Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: (value) => name = value,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
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
                _registerUser(name, email, password, context);
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 8.0), // Add some space between Register button and Sign In text
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigate to LoginScreen
                );
              },
              child: const Text(
                'Already have an account? Sign In',
                style: TextStyle(
                  color: Colors.blue, // You can set the text color as per your design
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}