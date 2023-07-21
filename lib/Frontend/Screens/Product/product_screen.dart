import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../Constant/Constant.dart';
import 'features_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 2,
            title: const Text("Tailored products that fit your needs",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black))),
        body: CarouselSlider(
          options: CarouselOptions(
              height: orientation == Orientation.portrait
                  ? screenHeight * 0.8
                  : screenHeight * 0.6,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              viewportFraction: 0.5),
          items: [
            buildCarouselItem("Hospital", orientation, screenWidth,
                screenHeight, 'assets/images/hospital.png', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FeatureScreen()));
            }),
            buildCarouselItem("Private Clinic", orientation, screenWidth,
                screenHeight, 'assets/images/clinic.png', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FeatureScreen()));
            }),
            buildCarouselItem("Pharmacy", orientation, screenWidth,
                screenHeight, 'assets/images/pharmacy.png', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FeatureScreen()));
            }),
            buildCarouselItem("Lab", orientation, screenWidth, screenHeight,
                'assets/images/lab.png', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FeatureScreen()));
            }),
          ],
        ));
  }

  Widget buildCarouselItem(
    String title,
    Orientation orientation,
    double screenWidth,
    double screenHeight,
    String assetPath,
    VoidCallback onPressed,
  ) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700),
        ),
        Container(
          width: orientation == Orientation.portrait
              ? screenWidth * 0.45
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
            elevation: 4,
            backgroundColor: kPrimaryLightColor,
            foregroundColor: Colors.black,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            shape: const RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(8.0),
                ),
          ),
          child: const Text(
            "Explore",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        )
      ],
    );
  }
}
