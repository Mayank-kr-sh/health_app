import 'package:flutter/material.dart';
import 'package:health_app/Frontend/auth/layout.dart';
import 'package:health_app/Frontend/auth/staff_login.dart';

import 'forget.dart';
import 'doctor_login.dart';
import 'form_hospital.dart';

class Hospital_Login extends StatelessWidget {
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
          bgColor1: Color(0xff6699CC),
          title: 'FORGOT YOUR PASSWORD - CLINICS & HOSPITALS',
        );
      },
    );
  }

  void _navigateToDoctorScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Doctor_Login()),
    );
  }

  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HospitalRegister()),
      // Hospital_Login()),
    );
  }

  const Hospital_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: ScreenLayout(
            disc: 'We are here to help simplify your day',
            bgColor1: const Color(0xff6699CC),
            title: 'LOGIN FOR CLINICS & HOSPITALS',
            button1: 'Doctor Login',
            bgColor2: const Color(0xff20b2aa),
            onPressed1: () => _navigateToDoctorScreen(context),
            button2: 'Staff Login',
            bgColor3: const Color(0xffac8a5c),
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
