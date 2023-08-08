import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_app/Frontend/Screens/Tracked%20Symptoms/symptoms_page.dart';

import '../../Constant/Constant.dart';
import '../../Widgets/dot_button.dart';

class TrackedSymptoms extends StatefulWidget {
  const TrackedSymptoms({super.key});

  @override
  State<TrackedSymptoms> createState() => _TrackedSymptomsState();
}

class _TrackedSymptomsState extends State<TrackedSymptoms> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kPrimaryLightColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Removes the shadow
          // title: const Text(
          //   'Track Symptoms',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/symptoms.svg",
                color: kSecondaryColor,
                width: 50,
              ),

              const SizedBox(
                height: 30,
              ),
              const Text("Track Symptoms",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22)),
              const SizedBox(
                height: 5,
              ),
              const Text("Start tracking your symptoms and conditions",
                  style: TextStyle(fontSize: 14)),
              const Text("Click the add button below and then search for a ",
                  style: TextStyle(fontSize: 14)),
              const Text("symptoms or condition by name",
                  style: TextStyle(fontSize: 14)),
              SizedBox(
                height: screenHeight / 2 - 200,
              ),

              Center(
                child: Dotbutton(
                    text: "Add Symptoms or condition",
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchSymptoms()))
                        }),
              ),
              // Center(
              //   child: TransparentButton(
              //     text: 'Tracked Symptoms',
              //     onPressed: () {
              //       // Action to perform when the button is pressed
              //       print('Button pressed!');
              //     },
              //   ),
              // ),
            ]));
  }
}
