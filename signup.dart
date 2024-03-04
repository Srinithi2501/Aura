import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/constant.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isAccountCreated = false;
  
  get signupString => null;

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _createAccount() {
    if (_formKey.currentState!.validate()) {
      // Simulate account creation, you can replace this with your actual logic
      // For demonstration, I'm just setting a flag to indicate account creation success
      setState(() {
        _isAccountCreated = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              Stack(
                children: <Widget>[
                  Image.asset(
                    bgImage,
                    height: height * 0.40,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: height * 0.40,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: [0.3, 0.7],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  appName,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                ),
              ),
              Center(
                child: Text(
                  slogan,
                  style: TextStyle(color: const Color.fromARGB(255, 113, 28, 128)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 20),
                child: Container(
                  child: Text(
                    "  $signupString",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      primaryColor.withOpacity(0.2),
                      Colors.transparent
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.00, vertical: 10.00),
                child: TextFormField(
                  controller: _usernameController,
                  validator: _validateUsername,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    prefixIcon: Icon(Icons.person, color: primaryColor),
                    labelText: "USERNAME",
                    labelStyle: TextStyle(color: primaryColor, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.00, vertical: 10.00),
                child: TextFormField(
                  controller: _emailController,
                  validator: _validateEmail,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    prefixIcon: Icon(Icons.email, color: primaryColor),
                    labelText: "EMAIL ADDRESS",
                    labelStyle: TextStyle(color: primaryColor, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.00),
                child: TextFormField(
                  controller: _passwordController,
                  validator: _validatePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    prefixIcon: Icon(Icons.lock_open, color: primaryColor),
                    labelText: "PASSWORD",
                    labelStyle: TextStyle(color: primaryColor, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.00),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  validator: _validateConfirmPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    prefixIcon: Icon(Icons.lock_open, color: primaryColor),
                    labelText: "CONFIRM PASSWORD",
                    labelStyle: TextStyle(color: primaryColor, fontSize: 16),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: height * 0.08,
                  width: width - 30,
                  child: ElevatedButton(
                    onPressed: _createAccount,
                    child: Text("SIGN UP",
                        style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (_isAccountCreated)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Account successfully created!",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Log In"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
