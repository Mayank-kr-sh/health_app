import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_app/Frontend/Widgets/Sliding.dart';
import 'package:health_app/Frontend/Widgets/Sliding_points.dart';
import 'package:health_app/Frontend/Widgets/middle_banar.dart';

import '../Widgets/Banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

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
            const DynamicBanner(
              backimage: 'assets/images/poster.png',
              description:
                  "Halemind is an ingenious, leading edge and connected EMR and HMS that empowers independent practices and hospitals. Halemind's secure, advanced and speciality driven EHR that enables you to run your practice in a simpler and efficient way, so you can focus on what matters the most - Your Patients.",
              buttonText: 'Get Started for Free',
              thumbnailAsset: 'assets/images/thumbnail.png',
              videoUrl: 'https://www.youtube.com/watch?v=tnxGPvZcOWk',
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Tailored products that fit your needs',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 105, 102, 102),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SlidingContainer(
                    text: 'Private Practices & Clinics',
                    imagePath: 'assets/images/clinic.png',
                    desc:
                        'Web-based EHR technology for your independent practice',
                    buttonText: 'Explore',
                    onPressed: () {},
                  ),
                  SlidingContainer(
                    text: 'Hospitals',
                    imagePath: 'assets/images/hospital.png',
                    buttonText: 'Explore',
                    desc:
                        'An integrated hospital management system to manage all hospital operations',
                    onPressed: () {},
                  ),
                  SlidingContainer(
                    text: 'Pharmacies',
                    imagePath: 'assets/images/pharmacy.png',
                    buttonText: 'Explore',
                    desc:
                        'Comprehensive pharmacy management system to manage your pharmacy needs',
                    onPressed: () {},
                  ),
                  SlidingContainer(
                    text: 'Labs',
                    imagePath: 'assets/images/lab.png',
                    desc:
                        'A web-based lab management software that supports your modern laboratory operations',
                    buttonText: 'Explore',
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const MiddleBanner(
              backimage: 'assets/images/poster.png',
              heading: 'Simplify and Scale your Practice',
              image1: 'assets/images/download.png',
              image2: 'assets/images/computer.png',
              image3: 'assets/images/system.png',
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 8),
              child: Text(
                'Halemind is an ingenious, leading edge and connected EMR/HMS that provides insightful, actionable and focussed data',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 105, 102, 102),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SlidingPoints(
                    imagePath: 'assets/icons/Search.svg',
                    text: 'Evidence based care',
                    desc:
                        'Optimize decision-making by emphasising the use of evidence from your clinical data.',
                  ),
                  SlidingPoints(
                    imagePath: 'assets/icons/tracker.svg',
                    text: 'Track patient behavior',
                    desc: 'Easily monitor, view and communicate with patients.',
                  ),
                  SlidingPoints(
                    imagePath: 'assets/icons/calender.svg',
                    text: 'Simplify schedules',
                    desc:
                        'Make short work of complicated doctor schedules with our smart calendar.',
                  ),
                  SlidingPoints(
                    imagePath: 'assets/icons/consume-data.svg',
                    text: 'Easy-to-consume data',
                    desc:
                        'Effortlessly visualize and analyze all the data you need.',
                  ),
                  SlidingPoints(
                    imagePath: 'assets/icons/data.svg',
                    text: 'Empower your patients',
                    desc:
                        'Watch patients track their own progress, from lab reports to prescription slips.',
                  ),
                  SlidingPoints(
                    imagePath: 'assets/icons/administrater.svg',
                    text: 'Administrator Bliss',
                    desc:
                        'Manage your hospital from a single dashboard. Connected records, billing, digital prescriptions, patient portal & more.',
                  ),
                  SlidingPoints(
                    imagePath: 'assets/icons/connect.svg',
                    text: 'Powerfully Connected',
                    desc:
                        'The future is here: patient remote monitoring, seamless connectivity between hospitals, pre-filled forms and much more.',
                  ),
                  SlidingPoints(
                    imagePath: 'assets/icons/beyond.svg',
                    text: 'Above & Beyond',
                    desc:
                        'More than just a management system – it is a connected health care platform creating healthier, happier and satisfied patients.',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
