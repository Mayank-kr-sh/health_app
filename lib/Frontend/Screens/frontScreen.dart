import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Widgets/custom_button.dart';

import '../Constant/Constant.dart';
import '../Widgets/bottom_nav.dart';
// import 'HomeScreen.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kPrimaryLightColor,
                  kPrimaryColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/logi3.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize:
                    MainAxisSize.min, // Set the column height to minimum
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30, left: 60, right: 60),
                    child: Center(
                      child: Text(
                        "Royal Hospital",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30, left: 60, right: 60),
                    child: Center(
                      child: Text(
                        'This app is an ingenious, leading edge and connected EMR and HMS that empowers independent practices and hospitals. ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  CustomButton(
                    text: 'Get Started',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomBottomNavBar()),
                        // Hospital_Login()),
                      );
                    },
                    width: 150,
                    height: 50,
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
