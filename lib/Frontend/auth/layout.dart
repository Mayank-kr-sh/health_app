import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Constant/Constant.dart';
import '../Widgets/Text_field.dart';
import '../Widgets/auth_poster.dart';
import '../Widgets/custom_button.dart';

class ScreenLayout extends StatefulWidget {
  final Color bgColor1;
  final String title;
  final String button1;
  final Color bgColor2;
  final String button2;
  final bool isRegister;
  final Color bgColor3;
  final VoidCallback onPressed2;
  final VoidCallback onPressed3;
  final VoidCallback onPressed4;

  const ScreenLayout({
    Key? key,
    required this.bgColor1,
    required this.title,
    required this.button1,
    required this.bgColor2,
    required this.bgColor3,
    required this.onPressed2,
    required this.button2,
    required this.onPressed3,
    required this.onPressed4,
    required this.isRegister,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScreenLayoutState createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
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
                textColor: Colors.white,
                text: 'OK',
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: widget.bgColor1,
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
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: widget.bgColor1,
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
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: widget.bgColor1,
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.09),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.bgColor1,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryColor.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  height: 50,
                  child: Center(
                      child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  )),
                ),
                const SizedBox(height: 20),
                LoginTextField(
                  controller: _emailOrPhoneController,
                  labelText: 'Enter Email or Phone Number',
                  hintText: '',
                  bgColor1: widget.bgColor1,
                ),
                LoginTextField(
                  controller: _passwordController,
                  labelText: 'Enter Password',
                  hintText: '',
                  isPassword: true,
                  bgColor1: widget.bgColor1,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: CustomButton(
                    text: "Log In",
                    width: double.infinity,
                    height: 50,
                    onPressed: _handleLoginButtonPress,
                    backgroundColor: kSecondaryColor,
                    textColor: Colors.white,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: widget.isRegister
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: widget.onPressed4,
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: widget.onPressed3,
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: TextButton(
                            onPressed: widget.onPressed3,
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
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
          // const SizedBox(height: 10),
          // CustomButton(
          //   width: double.infinity,
          //   height: 50,
          //   text: widget.button2,
          //   onPressed: widget.onPressed2,
          //   backgroundColor: widget.bgColor3,
          //   textColor: Colors.white,
          //   //  backgroundColor: const Color(0xffac8a5c),
          // ),
          const SizedBox(height: 30),
          const loginBanner(),
        ],
      ),
    );
  }
}
