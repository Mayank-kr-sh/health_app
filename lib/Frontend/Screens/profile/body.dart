import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Screens/Case%20Sheet/ipd_case_sheet.dart';
import 'package:health_app/Frontend/Screens/Tracked%20Symptoms/Tracked_symptoms.dart';
import 'package:health_app/Frontend/Screens/med%20reminder/set_reminder.dart';
import '../../Constant/Constant.dart';
import 'profile_menu.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        color: kPrimaryLightColor,
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: const Text("Our Services",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700))),
            ProfileMenu(
                text: "IPD Case Sheet",
                icon: "assets/icons/hospital.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IPDCaseSheet()),
                  );
                }),
            ProfileMenu(
                text: "Medicine Reminder",
                icon: "assets/icons/clock.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SetReminders()),
                  );
                }),
            ProfileMenu(
                text: "Track Symptoms",
                icon: "assets/icons/drugs.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TrackedSymptoms()),
                  );
                }),
            ProfileMenu(
                text: "Lab Management Software",
                icon: "assets/icons/lab.svg",
                press: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Procedures()),
                  // );
                }),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: const Text("Saved",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w700))),
            // ProfileMenu(
            //   text: "Conditions",
            //   icon: "assets/icons/conditions.svg",
            //   press: () {},
            // ),
            // ProfileMenu(
            //   text: "Drugs",
            //   icon: "assets/icons/drugs.svg",
            //   press: () {},
            // ),
            // ProfileMenu(
            //   text: "Articles",
            //   icon: "assets/icons/articles.svg",
            //   press: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
