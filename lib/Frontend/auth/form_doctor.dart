// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:health_app/Frontend/Widgets/custom_button.dart';

import '../Constant/Constant.dart';

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
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), // Rounded border
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: kSecondaryColor.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextFormField(
              enabled: false,
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                border: InputBorder
                    .none, // Remove border to use the custom rounded border of the container
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
                suffixIcon: Icon(Icons.calendar_today),
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
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required TextEditingController controller,
    bool isPassword = false,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    IconData? prefixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0), // Rounded border
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: kSecondaryColor.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          cursorColor: kSecondaryColor,
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
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: Colors.grey,
                    size: 20,
                  )
                : null,
            border: InputBorder
                .none, // Remove border to use the custom rounded border of the container
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      // Toggle password visibility
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: kSecondaryColor,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      key: _scaffoldMessengerKey,
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: const Text(
          'Create an Account - Doctors',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
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
                color: Colors.black.withOpacity(0.09),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.8),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  _buildTextField(
                    labelText: 'Email Address',
                    controller: _doctor.emailOrPhoneController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email_outlined,
                  ),
                  _buildTextField(
                    labelText: 'Enter Name',
                    controller: _doctor.firstNameController,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icons.person,
                  ),
                  _buildTextField(
                    labelText: 'Password',
                    controller: _doctor.passwordController,
                    isPassword: true,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icons.lock,
                  ),
                  _buildTextField(
                    labelText: 'Registration Number',
                    controller: _doctor.registrationNumberController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.format_list_numbered_rounded,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDatePickerField(),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: kSecondaryColor.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: Icon(
                                    Icons.male,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    items: const [
                                      DropdownMenuItem(
                                          value: 'Male', child: Text('Male')),
                                      DropdownMenuItem(
                                          value: 'Female',
                                          child: Text('Female')),
                                      DropdownMenuItem(
                                          value: 'Other', child: Text('Other')),
                                    ],
                                    onChanged: (value) {
                                      // Handle dropdown value changes.
                                      setState(() {
                                        _doctor.gender = value;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Gender',
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.0,
                                      ),
                                      border: InputBorder
                                          .none, // Remove border to use the custom rounded border of the container
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 8.0,
                                        horizontal: 1.0,
                                      ),
                                    ),
                                    validator: _validateGender,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildTextField(
                    labelText: 'Speciality',
                    controller: _doctor.specialityController,
                    textInputAction: TextInputAction.done,
                    prefixIcon: Icons.medical_services,
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
                      backgroundColor: kSecondaryColor,
                      text: 'Create an Account',
                      textColor: Colors.white,
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
