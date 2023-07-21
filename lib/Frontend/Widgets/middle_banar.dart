import 'package:flutter/material.dart';

class MiddleBanner extends StatelessWidget {
  final String backimage;
  final String heading;
  final String image1;
  final String image2;
  final String image3;

  const MiddleBanner({
    Key? key,
    required this.backimage,
    required this.heading,
    required this.image1,
    required this.image2,
    required this.image3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            backimage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: const Color(0xff188ba0).withOpacity(0.8),
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  heading,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 150,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image1),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image2),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image3),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
