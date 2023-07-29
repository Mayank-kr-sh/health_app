import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constant/Constant.dart';

class IPDCaseSheet extends StatefulWidget {
  const IPDCaseSheet({super.key});

  @override
  State<IPDCaseSheet> createState() => _IPDCaseSheetState();
}

class _IPDCaseSheetState extends State<IPDCaseSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "IPD Case Sheet",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.black,
        ),
        backgroundColor: kPrimaryLightColor,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              // height: 200,
              color: kPrimaryLightColor,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 10, 8),
                          child: TextField(
                            // onChanged: ,
                            cursorColor: kPrimaryLightColor,
                            decoration: InputDecoration(
                              labelText: 'UHID NO',
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 18.0,
                                horizontal: 16.0,
                              ),
                              labelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kSecondaryColor),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kSecondaryColor),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.perm_identity,
                                  color: kSecondaryColor),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 20, 8),
                          child: TextField(
                            cursorColor: kPrimaryLightColor,
                            decoration: InputDecoration(
                              labelText: 'Bed No',
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 18.0,
                                horizontal: 16.0,
                              ),
                              labelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kSecondaryColor),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kSecondaryColor),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.bed_outlined,
                                  color: kSecondaryColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: TextField(
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        labelText: 'Consultant',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          horizontal: 16.0,
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.chat_bubble_outline,
                            color: kSecondaryColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: TextField(
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          // horizontal: 16.0,
                        ),
                        labelText: 'Patient\'s Name',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon:
                            const Icon(Icons.person, color: kSecondaryColor),
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      SexInputField(),
                      AgeInputField(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: TextField(
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          // horizontal: 16.0,
                        ),
                        labelText: 'Contact Number',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.perm_contact_cal_outlined,
                            color: kSecondaryColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: TextField(
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        alignLabelWithHint: true,
                        // floatingLabelAlignment: Alignment.topLeft,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          // horizontal: 16.0,
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.location_on_outlined,
                            color: kSecondaryColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: TextField(
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        labelText: 'Provisional Diagnosis',
                        alignLabelWithHint: true,
                        // floatingLabelAlignment: Alignment.topLeft,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          // horizontal: 16.0,
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: SvgPicture.asset(
                              "./assets/icons/diagnosis.svg",
                              width: 25,
                              // color: kPrimbggaryLightColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: TextField(
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        labelText: 'Final Diagnosis',
                        alignLabelWithHint: true,
                        // floatingLabelAlignment: Alignment.topLeft,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          // horizontal: 16.0,
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: SvgPicture.asset(
                              "./assets/icons/diagnosis.svg",
                              width: 25,
                              color: kSecondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: const Text(
                      "Schedule A Demo",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}

class AgeInputField extends StatelessWidget {
  const AgeInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
        child: TextField(
          // controller: _controller,
          keyboardType: TextInputType.number,
          cursorColor: kPrimaryColor,

          decoration: InputDecoration(
            labelText: 'Age',
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 16.0,
            ),
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kSecondaryColor),
              borderRadius: BorderRadius.circular(16.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kSecondaryColor),
              borderRadius: BorderRadius.circular(16.0),
            ),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.cake_outlined, color: kSecondaryColor),
          ),
        ),
      ),
    );
  }
}

class SexInputField extends StatefulWidget {
  const SexInputField({
    super.key,
  });

  @override
  State<SexInputField> createState() => _SexInputFieldState();
}

class _SexInputFieldState extends State<SexInputField> {
  @override
  Widget build(BuildContext context) {
    String? _validateGender(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please select a gender';
      }
      return null;
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        child: DropdownButtonFormField<String>(
          items: const [
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
            DropdownMenuItem(value: 'Other', child: Text('Other')),
          ],
          onChanged: (value) {
            // Handle dropdown value changes.
            setState(() {
              // _doctor.gender = value;
            });
          },
          decoration: InputDecoration(
            labelText: 'Gender',
            labelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kSecondaryColor),
              borderRadius: BorderRadius.circular(16.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kSecondaryColor),
              borderRadius: BorderRadius.circular(16.0),
            ),
            prefixIcon: const Icon(Icons.female, color: kSecondaryColor),
          ),
          validator: _validateGender,
        ),
      ),
    );
  }
}
