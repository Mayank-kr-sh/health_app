import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Widgets/bottom_nav.dart';

import 'Frontend/Constant/Constant.dart';
import 'Frontend/Screens/Contact.dart';
import 'Frontend/Screens/Doctor.dart';
import 'Frontend/Screens/HomeScreen.dart';
import 'Frontend/Screens/Profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showDialog = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 20), () {
      setState(() {
        _showDialog = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kPrimaryColor),
      home: const CustomBottomNavBar(),
    );
  }
}
