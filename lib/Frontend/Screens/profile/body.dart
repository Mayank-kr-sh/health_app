import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Screens/Case%20Sheet/ipd_case_sheet.dart';
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
                text: "Clinic Management Software",
                icon: "assets/icons/clinic.svg",
                press: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const TrackedSymptoms()),
                  // );
                }),
            ProfileMenu(
                text: "Pharmacy Management Software",
                icon: "assets/icons/drugs.svg",
                press: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Procedures()),
                  // );
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
