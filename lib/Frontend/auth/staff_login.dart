import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Constant/Constant.dart';
import 'package:health_app/Frontend/auth/layout.dart';
import 'forget.dart';
import 'doctor_login.dart';

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
          bgColor1: kSecondaryColor,
          title: 'FORGOT YOUR PASSWORD - STAFF',
        );
      },
    );
  }

  const Staff_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: const Text(
          'Royal Hospital Staff Portal',
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
          title: 'We are here to help simplify your day',
          button1: 'Hospital Login',
          bgColor2: kSecondaryColor,
          button2: 'Doctor Login',
          bgColor3: kSecondaryColor,
          onPressed2: () => _navigateToDoctorScreen(context),
          onPressed3: () => _navigateToForgetScreen(context),
          onPressed4: () => _navigateToForgetScreen(context),
          isRegister: false,
        ),
      ),
    );
  }
}
