import 'package:fertility_consult/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fertility_consult/Screens/registration_screen.dart'; // Import your registration screen
import 'package:fertility_consult/models/registration_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fertility Consult',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: FutureBuilder<bool>(
        future: RegistrationHelper.checkLoginStatus(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading indicator while checking login status
          } else {
            if (snapshot.hasError) {
              return const Text('Error'); // Handle error case
            } else {
              return snapshot.data! ? const HomeView() : const RegistrationScreen();
              // Use HomeView as the initial screen if user is logged in, otherwise use LoginRegistrationScreen
            }
          }
        },
      ),
    );
  }
}

