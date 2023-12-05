import 'package:flutter/material.dart';
import 'package:fertility_consult/Screens/home_screen.dart';
import 'package:fertility_consult/Screens/profile_screen.dart';
import 'package:fertility_consult/Screens/help_screen.dart';
import 'package:fertility_consult/Screens/reproductive_service_screen.dart';
import 'package:fertility_consult/Screens/RegistrationScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fertility Consult',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    HomeView(),
    ProfileView(),
    ReproductiveServicesView(),
    HelpView(),
  ];

  @override
  Widget build(BuildContext context) {
    bool isUserRegistered = false; // Replace this with your logic to check if the user is registered

    if (!isUserRegistered) {
      // If the user is not registered, navigate to the registration page
      return RegistrationScreen(); // Replace RegistrationScreen with your registration page widget
    }

    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}
