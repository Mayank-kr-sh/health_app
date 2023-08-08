import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Constant/Constant.dart';
import 'package:health_app/Frontend/Widgets/custom_button.dart';
import 'package:health_app/Frontend/admin/patient_list_screen.dart';
import '../Widgets/video_popup.dart';

class DynamicBanner extends StatelessWidget {
  final String backimage;
  final String description;
  final String buttonText;
  final String? thumbnailAsset;
  final String? imageAsset;
  final String? videoUrl;

  const DynamicBanner({
    Key? key,
    required this.backimage,
    required this.description,
    required this.buttonText,
    this.thumbnailAsset,
    this.imageAsset,
    this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.48,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            backimage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            color: Color(0xff38b6ff).withOpacity(0.8),
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CustomButton(
                        text: buttonText,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PatientListScreen(),
                            ),
                          );
                        },
                        backgroundColor: kSecondaryColor,
                        textColor: Colors.white),
                  ),
                  if (videoUrl != null)
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return VideoPlayerDialog(
                              videoUrl: videoUrl!,
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
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            padding: const EdgeInsets.all(7),
                            child: Image.asset(
                              thumbnailAsset!,
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
                  if (imageAsset != null)
                    Container(
                      height: orientation == Orientation.portrait
                          ? screenHeight * 0.25
                          : screenHeight * 0.6,
                      width: orientation == Orientation.portrait
                          ? screenWidth * 0.9
                          : screenWidth * 0.48,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
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
                            imageAsset!,
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
