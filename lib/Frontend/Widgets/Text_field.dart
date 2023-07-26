import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final Color bgColor1;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.bgColor1,
    this.isPassword = false,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        cursorColor: bgColor1,
        onChanged: (value) {
          //search(value);
        },
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: bgColor1,
            ),
          ),
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
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: bgColor1,
                  ),
                )
              : null,
          errorText: null,
        ),
      ),
    );
  }
}
