import 'package:flutter/material.dart';

class QRCodeScannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
        backgroundColor: Colors.blue, // Adjust as needed
      ),
      body: Center(
        child: Text(
          'QR Code Scanner UI goes here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
