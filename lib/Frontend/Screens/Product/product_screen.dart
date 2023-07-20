import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Constant/Constant.dart';
import 'package:health_app/Frontend/Screens/Product/request_demo.dart';
import 'package:health_app/Frontend/Screens/Product/schedule_demo.dart';
import 'package:health_app/Frontend/Widgets/custom_button.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          title: const Text(
            "Halemind for Hospital",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const Center(
              //   child: Text(
              //     "Halemind for Hospital",
              //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Center(
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: const Text(
                  "Halemind's hospital management system is a customisable and integrated data management solution designed for Hospitals, Medical colleges and Clinics. Halemind's powerful cloud-based technology combined with expert customer support allows you to increase operational efficiency, optimize financial performance and deliver outstanding patient experiences.",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  // ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Request For A Free Demo',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DemoScreen()));
                  }),
              const SizedBox(
                height: 30,
              ),
              const ScheduleDemo()
            ],
          ),
        ));
  }
}
