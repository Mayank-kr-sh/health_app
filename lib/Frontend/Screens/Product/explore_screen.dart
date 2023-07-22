import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Constant/Constant.dart';
import 'package:health_app/Frontend/Screens/Product/schedule_demo.dart';

import '../../Widgets/Banner.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryLightColor,
        appBar: AppBar(
            title: const Text(
              "Halemind for Hospital",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: kPrimaryLightColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              color: Colors.black,
            )),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              DynamicBanner(
                backimage: 'assets/images/poster3.png',
                description:
                    "Halemind is an ingenious, leading edge and connected EMR and HMS that empowers independent practices and hospitals. Halemind's secure, advanced and speciality driven EHR that enables you to run your practice in a simpler and efficient way, so you can focus on what matters the most - Your Patients.",
                buttonText: 'Request for Free Demo',
                thumbnailAsset: 'assets/images/product.png',
                videoUrl: 'https://www.youtube.com/watch?v=tnxGPvZcOWk',
              ),
              ScheduleDemo()
            ],
          ),
        ));
  }
}
