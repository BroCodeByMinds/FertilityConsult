import 'package:fertility_consult/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fertility_consult/screens/DonateSpermAgreementScreen.dart'; 

class ReproductiveServicesView extends StatelessWidget {
  const ReproductiveServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reproductive Services'),
      ),
      body: ListView.builder(
        itemCount: Constants.reproductiveServices.length,
        itemBuilder: (BuildContext context, int index) {
          final String service = Constants.reproductiveServices[index];
          return _buildSection(context, service);
        },
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title) {
    return Card(
      margin: const EdgeInsets.all(8.0),
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
            // Handle navigation for other services here
          }
        },
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}