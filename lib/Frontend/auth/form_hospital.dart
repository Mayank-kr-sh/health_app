// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Widgets/custom_button.dart';

class Doctor {
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
}

class HospitalRegister extends StatefulWidget {
  const HospitalRegister({Key? key}) : super(key: key);

  @override
  _HospitalRegisterState createState() => _HospitalRegisterState();
}

class _HospitalRegisterState extends State<HospitalRegister> {
  final Doctor _doctor = Doctor();

  void _clearFormFields() {
    _doctor.address1Controller.clear();
    _doctor.address2Controller.clear();
    _doctor.cityController.clear();
    _doctor.emailController.clear();
    _doctor.nameController.clear();
    _doctor.passwordController.clear();
    _doctor.phoneController.clear();
    _doctor.pincodeController.clear();
    _doctor.specialityController.clear();
    _doctor.stateController.clear();
    _doctor.websiteController.clear();
  }

  final _formKey = GlobalKey<FormState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  Widget _buildTextField({
    required String labelText,
    required TextEditingController controller,
    bool isPassword = false,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        cursorColor: const Color(0xff6699CC),
        obscureText: isPassword,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          // Add more validation logic for specific fields (e.g., email, password).
          return null;
        },
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff6699CC),
            ),
          ),
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: () {
                    // Toggle password visibility
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Color(0xff6699CC),
                  ),
                )
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldMessengerKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Create Your Account',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 241, 241),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff6699CC),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    height: 50,
                    child: const Center(
                      child: Text(
                        'CREATE YOUR ACCOUNT - CLINICS & HOSPITALS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  _buildTextField(
                    labelText: 'Hospital/Clinic Name',
                    controller: _doctor.nameController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _buildTextField(
                    labelText: 'Password',
                    controller: _doctor.passwordController,
                    isPassword: true,
                    textInputAction: TextInputAction.next,
                  ),
                  _buildTextField(
                    labelText: 'Email Address',
                    controller: _doctor.emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _buildTextField(
                    labelText: 'Phone number',
                    controller: _doctor.phoneController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                  _buildTextField(
                    labelText: 'Speciality',
                    controller: _doctor.specialityController,
                    textInputAction: TextInputAction.done,
                  ),
                  _buildTextField(
                    labelText: 'Website name',
                    controller: _doctor.websiteController,
                    textInputAction: TextInputAction.done,
                  ),
                  _buildTextField(
                    labelText: 'Address Line 1',
                    controller: _doctor.address1Controller,
                    textInputAction: TextInputAction.done,
                  ),
                  _buildTextField(
                    labelText: 'PineCode',
                    controller: _doctor.pincodeController,
                    keyboardType: TextInputType.number,
                  ),
                  _buildTextField(
                    labelText: 'Address Line 2',
                    controller: _doctor.address2Controller,
                    textInputAction: TextInputAction.done,
                  ),
                  _buildTextField(
                    labelText: 'City',
                    controller: _doctor.cityController,
                    textInputAction: TextInputAction.done,
                  ),
                  _buildTextField(
                    labelText: 'State',
                    controller: _doctor.stateController,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'By clicking "Create an account," you agree to our Terms & Conditions and Privacy Policy.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.0),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () {
                        _formKey.currentState!.validate();
                        if (_formKey.currentState!.validate()) {
                          final email = _doctor.emailController.text;
                          final password = _doctor.passwordController.text;
                          final number = _doctor.nameController.text;
                          final speciality = _doctor.specialityController.text;
                          final address1 = _doctor.address1Controller.text;
                          final address2 = _doctor.address2Controller.text;
                          final city = _doctor.cityController.text;
                          final state = _doctor.stateController.text;
                          final pincode = _doctor.pincodeController.text;
                          final website = _doctor.websiteController.text;
                          final name = _doctor.nameController.text;
                          print('Email: $email');
                          print('Password: $password');
                          print('Number: $number');
                          print('Speciality: $speciality');
                          print('Website Name: $website');
                          print('Address1: $address1');
                          print('Address2: $address2');
                          print('City: $city');
                          print('State: $state');
                          print('Pinecode: $pincode');
                          print('Name: $name');
                          _clearFormFields();
                        } else {
                          _scaffoldMessengerKey.currentState!.showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please fill all the required fields.'),
                            ),
                          );
                        }
                      },
                      backgroundColor: const Color(0xff6699CC),
                      text: 'Create an Account',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
