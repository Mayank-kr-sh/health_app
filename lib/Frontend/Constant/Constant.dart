import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 56, 182, 255);
const kPrimaryLightColor = Color.fromARGB(255, 152, 205, 249);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color.fromARGB(255, 40, 81, 143);
const kTextColor = Color(0xFF757575);

final List<String> imageList = [
  'assets/images/banner1.png',
  'assets/images/banner2.png',
  'assets/images/banner3.jpg',
];

final List<String> descriptions = [
  '• Electronic health records \n• Seamless platform\n• No revenue leakage\n',
  '• Easy appointment and registrations \n• Faster billing and patient discharges\n',
  '• Customized consultation templets\n• Healthcare analytics\n• Visual Case Sheet \n',
];

final List<String> Headings = [
  'Efficient Operations',
  'Patient Engagements',
  'Evdience Based Care',
];
