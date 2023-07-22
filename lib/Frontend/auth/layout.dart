import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../Constant/Constant.dart';
import '../Widgets/Text_field.dart';
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
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScreenLayoutState createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  int _currentIndex = 0;
  Timer? _carouselTimer;

  @override
  void initState() {
    super.initState();
    // Start the carousel slider timer
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % imageList.length;
      });
    });
  }

  @override
  void dispose() {
    // Cancel the carousel slider timer when the widget is disposed of
    _carouselTimer?.cancel();
    super.dispose();
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
                hintText: 'Email or Phone Number',
              ),
              LoginTextField(
                controller: _passwordController,
                labelText: 'Enter Password',
                hintText: 'Password',
                isPassword: true,
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton(
                    width: double.infinity,
                    height: 40,
                    text: 'Log In',
                    onPressed: () {},
                    backgroundColor: widget.bgColor1,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xff52c1ac),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xff52c1ac),
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
        const SizedBox(height: 20),
        CarouselSlider(
          items: imageList
              .map((item) => Container(
                    child: Center(
                      child: Image.asset(item),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        Text(
          descriptions[_currentIndex],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
