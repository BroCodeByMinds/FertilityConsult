import 'package:flutter/material.dart';
import 'package:fertility_consult/Screens/registration_screen.dart'; // Import your registration screen

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
      home: const RegistrationScreen(), // Use RegistrationScreen as the initial screen
    );
  }
}
