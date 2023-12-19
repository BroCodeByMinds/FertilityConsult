import 'package:fertility_consult/Utils/constants.dart';
import 'package:fertility_consult/api/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String? _selectedService;

  Future<void> _bookAppointment(BuildContext context, String selectedService) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('username');
    String? email = prefs.getString('email');
    String? token = prefs.getString('token');

    if (name != null && email != null && token != null) {
      Map<String, dynamic> requestData = {
        'name': name,
        'email': email,
        'token': token,
        'selectedService': selectedService,
        // Add any additional data required by your backend API
      };

      String apiUrl = ApiEndpoints.bookAppointment;

      try {
        print(apiUrl);
        print(requestData);
        var response = await http.post(
          Uri.parse(apiUrl),
          body: requestData,
        );

        if (response.statusCode == 200) {
          print('Appointment booked successfully');
          // Handle success here (e.g., show a success message)
        } else {
          print('Failed to book appointment. Status code: ${response.statusCode}');
          // Handle failure here (e.g., show an error message)
        }
      } catch (error) {
        print('Exception during API call: $error');
        // Handle exceptions (e.g., show an error message)
      }
    } else {
      print('User details are missing');
      // Handle missing user details
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Fertility Consult'),
      ),
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/IVF_image3.jpeg'), // Replace with your image asset
            height: 200,
            width: 200,
          ),
          const SizedBox(height: 20),
          const Text(
            'Are you Married and facing Infertility Problems?\n\nBook your appointment today!',
            textAlign: TextAlign.center,
          ),
          DropdownButton<String>(
            value: _selectedService,
            onChanged: (newValue) {
              setState(() {
                _selectedService = newValue; // Update the selected service
              });
            },
            items: Constants.reproductiveServices.map((String service) {
              return DropdownMenuItem<String>(
                value: service,
                child: Text(service),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              if (_selectedService != null) {
                _bookAppointment(context, _selectedService!);
              } else {
                print('Please select a service');
                // Show a message to select a service
              }
            },
            child: const Text('Book Appointment'),
          ),
        ],
      ),
    );
  }
}