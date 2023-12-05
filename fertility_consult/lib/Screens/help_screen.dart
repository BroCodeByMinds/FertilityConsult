import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
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
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}
