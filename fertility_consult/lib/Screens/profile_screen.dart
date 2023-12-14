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

          }),
          _buildListTileWithSeparator('Refer & Earn', () {
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

          }),
          _buildListTileWithSeparator('Settings', () {

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
        
      },
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
