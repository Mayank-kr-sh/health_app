import 'package:flutter/material.dart';
import 'package:health_app/Frontend/auth/forget.dart';
import 'package:health_app/Frontend/auth/patient_register.dart';

import '../Widgets/Text_field.dart';
import '../Widgets/custom_button.dart';

// ignore: camel_case_types
class Patient_Login extends StatefulWidget {
  Patient_Login({super.key});

  @override
  State<Patient_Login> createState() => _Patient_LoginState();
}

class _Patient_LoginState extends State<Patient_Login> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLoginButtonPress() {
    String emailOrPhone = _emailOrPhoneController.text.trim();
    String password = _passwordController.text.trim();

    if (emailOrPhone.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter your email/phone and password.'),
            actions: [
              CustomButton(
                text: 'OK',
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Color(0xfff0ca4d),
              ),
            ],
          );
        },
      );
    } else if (!_isValidEmail(emailOrPhone)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter a valid email address.'),
            actions: [
              CustomButton(
                text: 'OK',
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Color(0xfff0ca4d),
              ),
            ],
          );
        },
      );
    } else if (password.length < 6) {
      // Password too short error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Password must be at least 6 characters long.'),
            actions: [
              CustomButton(
                text: 'OK',
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Color(0xfff0ca4d),
              )
            ],
          );
        },
      );
    } else {
      // Proceed with the login process
      // Implement your login logic here
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void _navigateToForgetScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ForgotPasswordDialog(
          bgColor1: Color(0xfff0ca4d),
          title: 'FORGOT YOUR PASSWORD - PATIENTS & INDIVIDUALS',
        );
      },
    );
  }

  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PatientRegister()),
    );
  }

  Widget _buildPointRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 25, color: const Color(0xff188ba0)),
          const SizedBox(width: 10),
          Text(text,
              style: const TextStyle(fontSize: 16, color: Colors.black45)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.black,
        ),
        title: const Text(
          'Halemind Patient Portal',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Access your health records securely',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to Halemind Patient Portal',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45),
                    ),
                    const SizedBox(height: 10),
                    _buildPointRow(Icons.schedule, 'Schedule appointments'),
                    _buildPointRow(
                        Icons.receipt, 'Receive prescriptions and alerts'),
                    _buildPointRow(Icons.history, 'Transparent bill history'),
                    _buildPointRow(
                        Icons.settings, 'Manage your health and much more'),
                    _buildPointRow(
                        Icons.family_restroom, 'Track your family\'s health'),
                    _buildPointRow(
                        Icons.notifications, 'Get reminders and reports'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      LoginTextField(
                        controller: _emailOrPhoneController,
                        labelText: 'Enter Email or Phone Number',
                        hintText: '',
                        bgColor1: const Color(0xfff0ca4d),
                      ),
                      LoginTextField(
                        controller: _passwordController,
                        labelText: 'Enter Password',
                        hintText: '',
                        isPassword: true,
                        bgColor1: const Color(0xfff0ca4d),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: CustomButton(
                          width: double.infinity,
                          height: 40,
                          text: 'Log In',
                          onPressed: _handleLoginButtonPress,
                          backgroundColor: const Color(0xfff0ca4d),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => _navigateToRegister(context),
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => _navigateToForgetScreen(context),
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
