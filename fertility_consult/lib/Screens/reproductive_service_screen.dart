import 'package:flutter/material.dart';

class ReproductiveServicesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reproductive Services'),
      ),
      body: ListView(
        children: [
          _buildSection('Donate Sperm'),
          _buildSection('Donate Egg'),
          _buildSection('IVF Treatment'),
          _buildSection('ICSI Treatment'),
          _buildSection('IUI Treatment'),
          _buildSection('Infertility Counselling'),
          _buildSection('Male Infertility Counselling'),
          _buildSection('Female Infertility Counselling'),
          _buildSection('FET Treatment'),
          _buildSection('Embryo Banking'),
          _buildSection('Surrogacy'),
          _buildSection('Check Near Clinic'),
          _buildSection('Call Appointment'),
          _buildSection('Clinic Appointment'),
          _buildSection('Knowledge'),
        ],
      ),
    );
  }

  Widget _buildSection(String title) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title),
        onTap: () {
          // Handle tap on each section
          // Replace with your logic or navigate to the appropriate view
        },
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
