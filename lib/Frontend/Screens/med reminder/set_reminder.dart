import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_app/Frontend/Constant/Constant.dart';
import 'package:health_app/Frontend/Screens/med%20reminder/search_med.dart';

import '../../Widgets/dot_button.dart';

class SetReminders extends StatefulWidget {
  const SetReminders({super.key});

  @override
  State<SetReminders> createState() => _SetRemindersState();
}

class _SetRemindersState extends State<SetReminders> {
  // final screenHeight = MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kPrimaryLightColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Removes the shadow
          // title: const Text(
          //   'Medication Reminders',
          //   style: TextStyle(color: Colors.black87),
          // ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/icons/med_rem.svg',
                // color: null,
                width: 50,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Set Medication Reminder",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: screenHeight / 2 - 200,
            ),
            Dotbutton(
                text: "Add Reminder",
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchMed()))
                    }),
          ],
        ));
  }
}
