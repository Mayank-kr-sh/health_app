import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constant/Constant.dart';
import 'explore_screen.dart';
import 'key_features.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        elevation: 2,
        title: const Text(
          "Tailored products that fit your needs",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.4,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
                viewportFraction: 0.5,
              ),
              items: [
                buildCarouselItem(
                  "Hospital",
                  'assets/images/hospital.png',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExploreScreen(),
                      ),
                    );
                  },
                ),
                buildCarouselItem(
                  "Private Clinic",
                  'assets/images/clinic.png',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExploreScreen(),
                      ),
                    );
                  },
                ),
                buildCarouselItem(
                  "Pharmacy",
                  'assets/images/pharmacy.png',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExploreScreen(),
                      ),
                    );
                  },
                ),
                buildCarouselItem(
                  "Lab",
                  'assets/images/lab.png',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExploreScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft:
                    Radius.circular(30), // Adjust the radius value as needed
                topRight:
                    Radius.circular(30), // Adjust the radius value as needed
              ),
              child: Container(
                padding:
                    const EdgeInsets.only(top: 0), // Set top padding to zero
                color: kPrimaryLightColor,
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            alignment: Alignment.topCenter,
                            child: const Text(
                              "Key Features",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const KeyFeatures(
                        text: "Appointments Scheduling",
                        icon: "./assets/icons/calender.svg",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const KeyFeatures(
                        text: "Visual Case Sheets",
                        icon: "./assets/icons/case.svg",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const KeyFeatures(
                        text: "Patient Registration",
                        icon: "./assets/icons/patient_reg.svg",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const KeyFeatures(
                        text: "Unique Patient ID's",
                        icon: "./assets/icons/patient_id.svg",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const KeyFeatures(
                        text: "Out-patient Management",
                        icon: "./assets/icons/out_patient.svg",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const KeyFeatures(
                        text: "In-patient Management",
                        icon: "./assets/icons/in_patient.svg",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const KeyFeatures(
                        text: "OT Management",
                        icon: "./assets/icons/ot_patient.svg",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const KeyFeatures(
                        text: "Ward Management",
                        icon: "./assets/icons/ward_management.svg",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const KeyFeatures(
                        text: "Automated Billing",
                        icon: "./assets/icons/calender.svg",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget buildCarouselItem(
    String title,
    String assetPath,
    VoidCallback onPressed,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final orientation = MediaQuery.of(context).orientation;
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        return Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            Container(
              width: orientation == Orientation.portrait
                  ? screenWidth * 0.70
                  : screenWidth * 0.48,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.all(7),
                  child: Image.asset(
                    assetPath,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              child: const Text(
                "Explore",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
