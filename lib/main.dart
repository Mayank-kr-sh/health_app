import 'package:flutter/material.dart';
// import 'package:health_app/Frontend/Widgets/bottom_nav.dart';

import 'Frontend/Constant/Constant.dart';
// import 'Frontend/Screens/admin/patient_list_screen.dart';
import 'Frontend/Screens/frontScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 20), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kPrimaryColor),
      //home: const CustomBottomNavBar(),
      home: const MyScreen(),
      // home: PatientListScreen(),
    );
  }
}
