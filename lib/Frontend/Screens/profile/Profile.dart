import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Screens/profile/body.dart';
import 'package:health_app/Frontend/Widgets/custom_button.dart';

import '../../Constant/Constant.dart';
import '../../auth/Patient_Login.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: kPrimaryLightColor,
        appBar: AppBar(
          backgroundColor: kPrimaryLightColor,
          elevation: 0, // Removes the shadow
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Profile',
                style: TextStyle(color: Colors.black87),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Patient_Login()));
                },
                child: const Row(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    Icon(
                      Icons.login_outlined,
                      color: kPrimaryColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight:
                      Radius.circular(20), // Adjust the radius value as needed
                  bottomLeft:
                      Radius.circular(20), // Adjust the radius value as needed
                  bottomRight: Radius.circular(20),
                ),
                child: Container(
                  color: kSecondaryColor,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Login Your Profile!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Text(" Save your important inoformation",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300)),
                            Text("so its always in your fingertips",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                      CustomButton(
                        text: "Create Profile",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Patient_Login()),
                          );
                        },
                        backgroundColor: kPrimaryColor,
                        textColor: kSecondaryColor,
                        // width: 120,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // const ProfilePic(),
            Container(height: 10),
            Container(
              color: Colors.white,
              child: Divider(
                color: kPrimaryColor,
                height: 2,
                thickness: 3,
                indent: screenWidth,
                endIndent: 10,
              ),
            ),
            const Body()
          ],
        ));
  }
}
