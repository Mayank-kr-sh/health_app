import 'package:flutter/material.dart';
import '../Widgets/Text_field.dart';
import '../Widgets/auth_poster.dart';
import '../Widgets/custom_button.dart';

class ScreenLayout extends StatefulWidget {
  final String disc;
  final Color bgColor1;
  final String title;
  final String button1;
  final Color bgColor2;
  final String button2;
  final Color bgColor3;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  final VoidCallback onPressed3;

  const ScreenLayout({
    Key? key,
    required this.disc,
    required this.bgColor1,
    required this.title,
    required this.button1,
    required this.bgColor2,
    required this.bgColor3,
    required this.onPressed1,
    required this.onPressed2,
    required this.button2,
    required this.onPressed3,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Halemind Providers Portal',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.disc,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 243, 241, 241),
            borderRadius: BorderRadius.circular(8),
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
                ),
                height: 50,
                child: Center(
                    child: Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                )),
              ),
              const SizedBox(height: 20),
              LoginTextField(
                controller: _emailOrPhoneController,
                labelText: 'Enter Email or Phone Number',
                hintText: '',
              ),
              LoginTextField(
                controller: _passwordController,
                labelText: 'Enter Password',
                hintText: '',
                isPassword: true,
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton(
                    width: double.infinity,
                    height: 40,
                    text: 'Log In',
                    onPressed: _handleLoginButtonPress,
                    backgroundColor: widget.bgColor1,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: widget.onPressed3,
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        CustomButton(
          width: double.infinity,
          height: 40,
          text: widget.button1,
          onPressed: widget.onPressed1,

          backgroundColor: widget.bgColor2,
          // backgroundColor: const Color(0xff20b2aa),
        ),
        const SizedBox(height: 10),
        CustomButton(
          width: double.infinity,
          height: 40,
          text: widget.button2,
          onPressed: widget.onPressed2,
          backgroundColor: widget.bgColor3,
          //  backgroundColor: const Color(0xffac8a5c),
        ),
        const SizedBox(height: 30),
        const loginBanner(),
      ],
    );
  }
}
