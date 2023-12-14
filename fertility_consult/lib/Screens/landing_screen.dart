import 'package:fertility_consult/Screens/registration_screen.dart';
import 'package:fertility_consult/Utils/constants.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Fertility Consult'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/IVF_image3.jpeg'), // Replace with your welcome image asset
            // Add image properties as needed
          ),
          const SizedBox(height: 20), // Add spacing between image and text
          const Text(
            'Are you Married and facing Infertility Problems?\nBook your appointment today!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20), // Add spacing between text and dropdown
          _buildDropdown(context),
        ],
      ),
    );
  }

  Widget _buildDropdown(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text('Select a service'), // Placeholder text
      items: Constants.reproductiveServices
          .map((String service) {
            return DropdownMenuItem<String>(
              value: service,
              child: Text(service),
            );
          })
          .toList(),
      onChanged: (String? selectedService) {
        // Handle selected service
        if (selectedService != null) {
          // Perform actions based on the selected service
          print('Selected service: $selectedService');
          // Add logic for handling the selected service
        }
      },
    );
  }
}