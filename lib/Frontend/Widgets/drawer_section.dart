import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_app/Frontend/Constant/Constant.dart';
import 'package:health_app/Frontend/Widgets/custom_button.dart';
// import 'package:health_app/Frontend/auth/hospital_login.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../auth/doctor_login.dart';
import '../auth/patient_register.dart';

class DrawerSection extends StatelessWidget {
  void _navigateToProvidersScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Doctor_Login()),
    );
  }

  void _navigateToPatientScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PatientRegister()),
    );
  }

  final String appLink = 'https://your_app_link';
  const DrawerSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final iconSize = screenSize.width * 0.06; // Adjust the percentage as needed
    final titleFontSize =
        16.0 * textScaleFactor; // Adjust the base font size as needed

    return Drawer(
      backgroundColor: kSecondaryColor,
      child: ListView(
        children: [
          // const Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     // Company Logo
          const Padding(
              padding: EdgeInsets.only(top: 8, left: 10, bottom: 8),
              child: Text(
                "Royal Hospital",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              )),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: CustomButton(
                onPressed: () => _navigateToProvidersScreen(context),
                text: 'Providers Login',
                backgroundColor: Colors.white,
                textColor: kSecondaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: CustomButton(
              onPressed: () => _navigateToPatientScreen(context),
              text: 'Patient Login',
              backgroundColor: Colors.white,
              textColor: kSecondaryColor,
              // width: 100,
            ),
          ),
          const Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset('assets/icons/drugs.svg',
                  width: iconSize, color: kPrimaryColor),
            ),
            title: Text(
              'Pills Identifier',
              style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const PillIdentifierPage(),
              //   ),
              // );
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(
                Icons.mic_none_outlined,
                size: iconSize,
                color: kPrimaryColor,
              ),
            ),
            title: Text(
              'Podcast',
              style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            onTap: () {
              // Handle podcast tap
            },
          ),
          const Divider(),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(
                Icons.notifications_none,
                size: iconSize,
                color: kPrimaryColor,
              ),
            ),
            title: Text(
              'Notifications',
              style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            onTap: () {
              // Handle notifications tap NotificationSettingsPage
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const NotificationSettingsPage(),
              //   ),
              // );
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(
                Icons.mail_outline,
                size: iconSize,
                color: kPrimaryColor,
              ),
            ),
            title: Text(
              'Newsletter',
              style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            onTap: () {
              // Handle newsletter tap NewsLetter
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const NewsLetter(),
              //   ),
              // );
            },
          ),
          const Divider(),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(
                Icons.feedback_outlined,
                size: iconSize,
                color: kPrimaryColor,
              ),
            ),
            title: Text(
              'Feedback',
              style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            onTap: () {
              // Handle feedback tap
              String feedbackMessage = 'Enter your feedback message here';
              Share.share(feedbackMessage);
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(
                Icons.privacy_tip_outlined,
                size: iconSize,
                color: kPrimaryColor,
              ),
            ),
            title: Text(
              'Privacy & Legal',
              style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const PrivacyLegalScreen(),
              //   ),
              // );
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(
                Icons.star_border,
                size: iconSize,
                color: kPrimaryColor,
              ),
            ),
            title: Text(
              'Rate and Review',
              style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            onTap: () {
              // Handle rate and review tap
              _launchPlayStore();
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(
                Icons.share,
                size: iconSize,
                color: kPrimaryColor,
              ),
            ),
            title: Text(
              'Tell Friends',
              style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            onTap: () {
              // Handle tell friends tap
              Share.share(appLink);
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(
                Icons.apps,
                size: iconSize,
                color: kPrimaryColor,
              ),
            ),
            title: Text(
              'Other WebMD Apps',
              style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            onTap: () {
              // Handle other WebMD apps tap
            },
          ),
        ],
      ),
    );
  }
}

void _launchPlayStore() async {
  const String packageName =
      'your_package_name'; // Replace with your app's package name
  final Uri playStoreUri =
      Uri.parse('https://play.google.com/store/apps/details?id=$packageName');

  if (await canLaunch(playStoreUri.toString())) {
    await launch(playStoreUri.toString());
  } else {
    throw 'Could not launch Play Store';
  }
}
