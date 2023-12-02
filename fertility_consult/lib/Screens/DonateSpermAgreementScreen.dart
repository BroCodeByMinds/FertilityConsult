import 'package:flutter/material.dart';
import 'package:fertility_consult/Screens/DonateSpermDetailsScreen.dart';
import 'package:fertility_consult/Utils/constants.dart';

class DonateSpermAgreementScreen extends StatefulWidget {
  @override
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
        title: Text('Donate Sperm Agreement'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Please read and agree to the terms:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(Constants.donateSpermAgreementInfo),
            SizedBox(height: 20.0),
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
                Text('I agree'),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_isAgreed) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DonateSpermDetailsScreen(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Agreement Required'),
                        content: Text(
                            'Please agree to the terms and conditions to proceed.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}
