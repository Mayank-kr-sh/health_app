import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Constant/Constant.dart';
import 'package:health_app/Frontend/auth/forget.dart';
import 'package:health_app/Frontend/auth/patient_register.dart';

import '../Widgets/Text_field.dart';
import '../Widgets/custom_button.dart';

// ignore: camel_case_types
class Patient_Login extends StatefulWidget {
  const Patient_Login({super.key});

  @override
  State<Patient_Login> createState() => _Patient_LoginState();
}

// ignore: camel_case_types
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
                  backgroundColor: kPrimaryColor),
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
                  backgroundColor: kPrimaryColor),
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
                  backgroundColor: kPrimaryColor)
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
          title: 'Forget Your Password Patients ',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.black,
        ),
        title: const Text(
          'Royal Hospital Patient Portal',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryLightColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const SizedBox(height: 20),
              const Text(
                'Access your health records securely',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to Royal Hospital Patient Portal',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: ServiceList(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 3), // changes position of shadow
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
                            bgColor1: kPrimaryColor),
                        LoginTextField(
                            controller: _passwordController,
                            labelText: 'Enter Password',
                            hintText: '',
                            isPassword: true,
                            bgColor1: kPrimaryColor),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: CustomButton(
                              width: double.infinity,
                              height: 40,
                              text: 'Log In',
                              onPressed: _handleLoginButtonPress,
                              backgroundColor: kPrimaryColor),
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
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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

class ServiceList extends StatelessWidget {
  const ServiceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.schedule,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Schedule appointments')
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.receipt,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Receive prescriptions and alerts')
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.history,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Transparent bill history')
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.settings,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Manage your health and much more')
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.family_restroom,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Track your family\'s health')
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.notifications,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Get reminders and report')
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
