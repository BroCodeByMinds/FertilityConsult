import 'package:flutter/material.dart';
import 'package:fertility_consult/screens/DonateSpermAgreementScreen.dart'; 

class ReproductiveServicesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reproductive Services'),
      ),
      body: ListView(
        children: [
          _buildSection(context, 'Donate Sperm'),
          _buildSection(context, 'Donate Egg'),
          _buildSection(context, 'IVF Treatment'),
          _buildSection(context, 'ICSI Treatment'),
          _buildSection(context, 'IUI Treatment'),
          _buildSection(context, 'Infertility Counselling'),
          _buildSection(context, 'Male Infertility Counselling'),
          _buildSection(context, 'Female Infertility Counselling'),
          _buildSection(context, 'FET Treatment'),
          _buildSection(context, 'Embryo Banking'),
          _buildSection(context, 'Surrogacy'),
          _buildSection(context, 'Check Near Clinic'),
          _buildSection(context, 'Call Appointment'),
          _buildSection(context, 'Clinic Appointment'),
          _buildSection(context, 'Knowledge'),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title),
        onTap: () {
          if (title == 'Donate Sperm') {
            // Navigate to DonateSpermAgreementScreen when "Donate Sperm" is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DonateSpermAgreementScreen(),
              ),
            );
          } else {
            // Handle other sections or navigation logic
          }
        },
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
