import 'package:flutter/material.dart';
import 'package:new_app/qrcodescanner.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Using a regex pattern for email validation
    bool isValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
    if (!isValid) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    // Checking for password strength
    if (value.length < 8) {
      return 'Password should be at least 8 characters long';
    }
    // You can add more sophisticated password strength validation if needed
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, navigate to the QR Code Scanner page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QRCodeScannerPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Your UI code for Login screen here
            ],
          ),
        ),
      ),
    );
  }
}
