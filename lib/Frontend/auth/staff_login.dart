import 'package:flutter/material.dart';
import 'package:health_app/Frontend/auth/layout.dart';

import 'forget.dart';
import 'doctor_login.dart';
import 'hospital_login.dart';

// ignore: camel_case_types
class Staff_Login extends StatelessWidget {
  void _navigateToDoctorScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Doctor_Login()),
    );
  }

  void _navigateToForgetScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ForgotPasswordDialog(
          bgColor1: Color(0xffac8a5c),
          title: 'FORGOT YOUR PASSWORD - STAFF',
        );
      },
    );
  }

  void _navigateToHospitalScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Hospital_Login()),
    );
  }

  const Staff_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: ScreenLayout(
            disc: 'We are here to help simplify your day',
            bgColor1: const Color(0xffac8a5c),
            title: 'LOGIN FOR STAFF',
            button1: 'Hospital Login',
            bgColor2: const Color(0xff6699CC),
            onPressed1: () => _navigateToHospitalScreen(context),
            button2: 'Doctor Login',
            bgColor3: const Color(0xff20b2aa),
            onPressed2: () => _navigateToDoctorScreen(context),
            onPressed3: () => _navigateToForgetScreen(context),
          ),
        ),
      ),
    );
  }
}
