import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../Constant/Constant.dart';

// ignore: camel_case_types
class loginBanner extends StatefulWidget {
  const loginBanner({super.key});

  @override
  State<loginBanner> createState() => _loginBannerState();
}

// ignore: camel_case_types
class _loginBannerState extends State<loginBanner> {
  int _currentIndex = 0;
  String _headingText = Headings[0];
  String _descriptionText = descriptions[0];
  Timer? _carouselTimer;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % imageList.length;
        _updateDescription();
        _updateTexts();
      });
    });
  }

  void _updateTexts() {
    setState(() {
      _headingText = Headings[_currentIndex];
      _descriptionText = descriptions[_currentIndex];
    });
  }

  void _updateDescription() {
    setState(() {
      _descriptionText = descriptions[_currentIndex];
    });
  }

  @override
  void dispose() {
    _carouselTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        _headingText,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 10),
      CarouselSlider(
        items: imageList
            .map((item) => Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                    child: Image.asset(item),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          aspectRatio: 3.0,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
              _updateDescription();
              _updateTexts();
            });
          },
        ),
      ),
      const SizedBox(height: 5),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: _descriptionText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const WidgetSpan(
              child: SizedBox(height: 10),
            ),
          ],
        ),
      ),
    ]);
  }
}
