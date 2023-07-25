// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Widgets/custom_button.dart';

class Doctor {
  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController registrationNumberController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  DateTime? dateOfBirth;
  String? gender;
}

class DoctorRegistrationPage extends StatefulWidget {
  const DoctorRegistrationPage({Key? key}) : super(key: key);

  @override
  _DoctorRegistrationPageState createState() => _DoctorRegistrationPageState();
}

class _DoctorRegistrationPageState extends State<DoctorRegistrationPage> {
  final Doctor _doctor = Doctor();

  void _clearFormFields() {
    _doctor.emailOrPhoneController.clear();
    _doctor.passwordController.clear();
    _doctor.firstNameController.clear();
    _doctor.lastNameController.clear();
    _doctor.registrationNumberController.clear();
    _doctor.specialityController.clear();
    _doctor.dateOfBirth = null;
    _doctor.gender = null;
  }

  final _formKey = GlobalKey<FormState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  String? _validateGender(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a gender';
    }
    return null;
  }

  String? _validateDateOfBirth(DateTime? value) {
    if (value == null) {
      return 'Please select a date of birth';
    }
    return null;
  }

  void _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(
              0xff20b2aa,
            ), // Change the date picker color to green
            hintColor: const Color(0xff20b2aa),
            colorScheme: const ColorScheme.light(primary: Color(0xff20b2aa)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && mounted) {
      setState(() {
        _doctor.dateOfBirth = pickedDate;
      });
    }
  }

  Widget _buildDatePickerField() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          _showDatePicker(); // Show the date picker when clicked on the field.
        },
        child: AbsorbPointer(
          absorbing: true,
          child: TextFormField(
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Date of Birth',
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              suffixIcon: const Icon(Icons.calendar_today),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff20b2aa),
                ),
              ),
            ),
            controller: _doctor.dateOfBirth != null
                ? TextEditingController(
                    text:
                        "${_doctor.dateOfBirth!.day}/${_doctor.dateOfBirth!.month}/${_doctor.dateOfBirth!.year}")
                : null,
            validator: (value) => _validateDateOfBirth(_doctor.dateOfBirth),
          ),
        ),
      ),
    );
  }

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
        cursorColor: const Color(0xff20b2aa),
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
              color: Color(0xff20b2aa),
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
                    color: Color(0xff20b2aa),
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
          'Create an Account',
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
                      color: Color(0xff20b2aa),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    height: 50,
                    child: const Center(
                      child: Text(
                        'CREATE YOUR ACCOUNT - DOCTORS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  _buildTextField(
                    labelText: 'Email or Phone Number',
                    controller: _doctor.emailOrPhoneController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _buildTextField(
                    labelText: 'Password',
                    controller: _doctor.passwordController,
                    isPassword: true,
                    textInputAction: TextInputAction.next,
                  ),
                  _buildTextField(
                    labelText: 'First Name',
                    controller: _doctor.firstNameController,
                    textInputAction: TextInputAction.next,
                  ),
                  _buildTextField(
                    labelText: 'Last Name',
                    controller: _doctor.lastNameController,
                    textInputAction: TextInputAction.next,
                  ),
                  _buildTextField(
                    labelText: 'Registration Number',
                    controller: _doctor.registrationNumberController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                  _buildDatePickerField(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButtonFormField<String>(
                      items: const [
                        DropdownMenuItem(value: 'Male', child: Text('Male')),
                        DropdownMenuItem(
                            value: 'Female', child: Text('Female')),
                        DropdownMenuItem(value: 'Other', child: Text('Other')),
                      ],
                      onChanged: (value) {
                        // Handle dropdown value changes.
                        setState(() {
                          _doctor.gender = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 16.0,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff20b2aa),
                          ),
                        ),
                      ),
                      validator: _validateGender,
                    ),
                  ),
                  _buildTextField(
                    labelText: 'Speciality',
                    controller: _doctor.specialityController,
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
                          final emailOrPhone =
                              _doctor.emailOrPhoneController.text;
                          final password = _doctor.passwordController.text;
                          final firstName = _doctor.firstNameController.text;
                          final lastName = _doctor.lastNameController.text;
                          final registrationNumber =
                              _doctor.registrationNumberController.text;
                          final speciality = _doctor.specialityController.text;
                          final dateOfBirth = _doctor.dateOfBirth;
                          final gender = _doctor.gender;
                          print('Email or Phone: $emailOrPhone');
                          print('Password: $password');
                          print('First Name: $firstName');
                          print('Last Name: $lastName');
                          print('Registration Number: $registrationNumber');
                          print('Speciality: $speciality');
                          print('Date of Birth: $dateOfBirth');
                          print('Gender: $gender');
                          _clearFormFields();
                        } else {
                          // Show a SnackBar with an error message.
                          _scaffoldMessengerKey.currentState!.showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please fill all the required fields.'),
                            ),
                          );
                        }
                      },
                      backgroundColor: const Color(0xff20b2aa),
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
