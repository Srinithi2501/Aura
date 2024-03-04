import 'package:flutter/material.dart';
import 'package:new_app/LoginScreen.dart';
import 'package:new_app/constant.dart';

void main(){
  runApp(const InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}