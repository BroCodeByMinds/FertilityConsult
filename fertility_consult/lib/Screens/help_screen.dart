import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: ListView(
        children: [
          _buildSection('New Clinic Booking Help',
              'If you need assistance with booking a new clinic, please contact our support team.'),
          _buildSection('Technical Issues',
              'Encountering technical problems? Our technical support team is here to help.'),
          _buildSection('Donate Sperm Referral Help',
              'For assistance with donation referrals, please reach out to our support team.'),
        ],
      ),
    );
  }

  Widget _buildSection(String header, String content) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}
