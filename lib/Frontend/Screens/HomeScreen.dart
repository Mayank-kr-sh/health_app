import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Widgets/video_popup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 2,
        centerTitle: true,
        backgroundColor: const Color(0xff5cb85c),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/images/logo2.svg',
                width: screenWidth * 0.4,
              ),
            ),
            Container(
              height: screenHeight * 0.48,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/poster.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: OrientationBuilder(
                builder: (context, orientation) {
                  return Container(
                    color: const Color(0xff188ba0).withOpacity(0.8),
                    padding: const EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Halemind is an ingenious, leading edge and connected EMR and HMS that empowers independent practices and hospitals. Halemind's secure, advanced and speciality driven EHR that enables you to run your practice in a simpler and efficient way, so you can focus on what matters the most - Your Patients.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle button click here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff52c1ac),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                minimumSize: Size(
                                  orientation == Orientation.portrait
                                      ? screenWidth * 0.6
                                      : screenHeight * 0.8,
                                  0,
                                ),
                              ),
                              child: const Text(
                                'Get Started for Free',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return VideoPlayerDialog(
                                    videoUrl:
                                        'https://www.youtube.com/watch?v=tnxGPvZcOWk',
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: orientation == Orientation.portrait
                                  ? screenHeight * 0.25
                                  : screenHeight * 0.6,
                              width: orientation == Orientation.portrait
                                  ? screenWidth * 0.9
                                  : screenWidth * 0.48,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  padding: const EdgeInsets.all(7),
                                  child: Image.asset(
                                    'assets/images/thumbnail.png',
                                    width: orientation == Orientation.portrait
                                        ? screenWidth * 0.7 - 10
                                        : screenWidth * 0.6 - 10,
                                    height: orientation == Orientation.portrait
                                        ? screenHeight * 0.3 - 10
                                        : screenHeight * 0.4 - 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
