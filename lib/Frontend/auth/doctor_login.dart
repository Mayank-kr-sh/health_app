import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Constant/Constant.dart';
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
          bgColor1: kSecondaryColor,
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
      backgroundColor: kPrimaryLightColor,
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
        backgroundColor: kPrimaryLightColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ScreenLayout(
          bgColor1: kSecondaryColor,
          title: 'Simplify your next appointment',
          bgColor2: kPrimaryColor,
          button1: 'Hospital Login',
          bgColor3: kSecondaryColor,
          button2: 'Staff Login',
          onPressed2: () => _navigateToStaffScreen(context),
          onPressed3: () => _navigateToForgetScreen(context),
          onPressed4: () => _navigateToRegister(context),
          isRegister: true,
        ),
      ),
    );
  }
}
