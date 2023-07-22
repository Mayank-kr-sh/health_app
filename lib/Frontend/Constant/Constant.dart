import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(232, 13, 204, 191);
const kPrimaryLightColor = Color.fromARGB(255, 140, 216, 246);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color.fromARGB(255, 55, 164, 207);
const kTextColor = Color(0xFF757575);

final List<String> imageList = [
  'assets/images/poster1.png',
  'assets/images/poster2.png',
  'assets/images/poster3.png',
];

final List<String> descriptions = [
  'Description 1',
  'Description 2',
  'Description 3',
];
