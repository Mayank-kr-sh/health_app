import 'package:flutter/material.dart';
import 'package:health_app/Frontend/auth/layout.dart';
import 'package:health_app/Frontend/auth/staff_login.dart';

import 'hospital_login.dart';

// ignore: camel_case_types
class Doctor_Login extends StatelessWidget {
  void _navigateToStaffScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Staff_Login()),
    );
  }

  void _navigateToHospitalScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Hospital_Login()),
    );
  }

  const Doctor_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: ScreenLayout(
            disc: 'Simplify your next appointment',
            bgColor1: const Color(0xff20b2aa),
            title: 'LOGIN FOR DOCTORS',
            bgColor2: const Color(0xff6699CC),
            button1: 'Hospital Login',
            onPressed1: () => _navigateToHospitalScreen(context),
            bgColor3: const Color(0xffac8a5c),
            button2: 'Staff Login',
            onPressed2: () => _navigateToStaffScreen(context),
          ),
        ),
      ),
    );
  }
}
