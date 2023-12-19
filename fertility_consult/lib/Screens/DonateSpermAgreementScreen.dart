import 'package:flutter/material.dart';
import 'package:fertility_consult/Screens/DonateSpermDetailsScreen.dart';
import 'package:fertility_consult/Utils/constants.dart';

class DonateSpermAgreementScreen extends StatefulWidget {
  const DonateSpermAgreementScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DonateSpermAgreementScreenState createState() =>
      _DonateSpermAgreementScreenState();
}

class _DonateSpermAgreementScreenState
    extends State<DonateSpermAgreementScreen> {
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate Sperm Agreement'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Please read and agree to the terms:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text(Constants.donateSpermAgreementInfo),
            const SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _isAgreed,
                  onChanged: (value) {
                    setState(() {
                      _isAgreed = value ?? false;
                    });
                  },
                ),
                const Text('I agree'),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_isAgreed) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DonateSpermDetailsScreen(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Agreement Required'),
                        content: const Text(
                            'Please agree to the terms and conditions to proceed.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}
