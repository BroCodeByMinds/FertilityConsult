import 'package:flutter/material.dart';
import 'package:fertility_consult/Screens/profile_screen.dart';
import 'package:fertility_consult/Screens/help_screen.dart';
import 'package:fertility_consult/Screens/reproductive_service_screen.dart';
import 'package:fertility_consult/Screens/registration_screen.dart'; // Import your registration screen
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isUserRegistered = false;
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    ProfileView(), // Replace with your actual ProfileView widget
    ReproductiveServicesView(), // Replace with your actual ReproductiveServicesView widget
    HelpView(), // Replace with your actual HelpView widget
  ];

  @override
  void initState() {
    super.initState();
    _checkRegistrationStatus();
  }

  Future<void> _checkRegistrationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');

    setState(() {
      isUserRegistered = storedUsername != null && storedUsername.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isUserRegistered ? _buildRegisteredUserUI() : const RegistrationScreen();
  }

  Widget _buildRegisteredUserUI() {
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
        items: const [
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
