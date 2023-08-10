import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../Constant/Constant.dart';

class Dotbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final svg;
  const Dotbutton({
    super.key,
    required this.text,
    required this.onPressed,
    this.svg,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
          // color: Colors.white,
          height: 120,
          width: 320,
          // color: Colors.amber,
          child: DottedBorder(
              borderType: BorderType.RRect,
              strokeWidth: 2,
              dashPattern: const [8, 10], // [dot radius, spacing]
              color: kSecondaryColor,
              radius: const Radius.circular(20),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_circle,
                        color: kSecondaryColor,
                        size: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(text),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
