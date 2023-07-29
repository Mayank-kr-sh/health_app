import 'package:flutter/material.dart';
import 'package:health_app/Frontend/auth/layout.dart';
import 'package:health_app/Frontend/auth/staff_login.dart';

import 'forget.dart';
import 'form_doctor.dart';

// ignore: camel_case_types
class Doctor_Login extends StatelessWidget {
  void _navigateToStaffScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Staff_Login()),
    );
  }

  void _navigateToForgetScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ForgotPasswordDialog(
          bgColor1: Color(0xff20b2aa),
          title: 'FORGOT YOUR PASSWORD - DOCTORS',
        );
      },
    );
  }

  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DoctorRegistrationPage()),
      // Hospital_Login()),
    );
  }

  const Doctor_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Royal Hospital Doctor Portal',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.black,
        ),
        backgroundColor: const Color(0xff20b2aa),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: ScreenLayout(
            bgColor1: const Color(0xff20b2aa),
            title: 'Simplify your next appointment',
            bgColor2: const Color(0xff6699CC),
            button1: 'Hospital Login',
            bgColor3: const Color(0xffac8a5c),
            button2: 'Staff Login',
            onPressed2: () => _navigateToStaffScreen(context),
            onPressed3: () => _navigateToForgetScreen(context),
            onPressed4: () => _navigateToRegister(context),
            isRegister: true,
          ),
        ),
      ),
    );
  }
}
