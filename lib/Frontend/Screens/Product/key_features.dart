import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KeyFeatures extends StatelessWidget {
  final String text;
  final String icon;
  const KeyFeatures({required this.text, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 28,
              ),
            ),
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
              ),
            )),
      ],
    );
  }
}
