import 'package:fertility_consult/Screens/AboutUsScreen.dart';
import 'package:flutter/material.dart';
import 'package:fertility_consult/Screens/help_screen.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: [
          _buildListTileWithSeparator('My Appointments', () {
            // Handle tap on "My Appointments"
            // Replace with your logic or navigate to the appropriate view
          }),
          _buildListTileWithSeparator('Refer & Earn', () {
            // Handle tap on "Refer & Earn"
            // Replace with your logic or navigate to the appropriate view
          }),
          _buildListTileWithSeparator('Help', () {
            // Navigate to HelpView on Help section tap
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HelpView()),
            );
          }),
          _buildListTileWithSeparator('About Us', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  AboutUsScreen()),
            );
          }),
          _buildListTileWithSeparator('Feedback', () {
            // Handle tap on "Feedback"
            // Replace with your logic or navigate to the appropriate view
          }),
          _buildListTileWithSeparator('Settings', () {
            // Handle tap on "Settings"
            // Replace with your logic or navigate to the appropriate view
          }),
          _buildListTileWithoutSeparator('Call Support'),
        ],
      ),
    );
  }

  Widget _buildListTileWithSeparator(String title, Function()? onTap) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          onTap: onTap,
          trailing: const Icon(Icons.chevron_right),
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildListTileWithoutSeparator(String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        // Handle tap on "Call Support"
      },
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
