import 'package:flutter/material.dart';

class DonateSpermDetailsScreen extends StatelessWidget {
  const DonateSpermDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sperm Donation Details'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Fill in your details here:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            // Add form fields to collect donation details here
            // For example: TextFields, Dropdowns, etc.
          ],
        ),
      ),
    );
  }
}
