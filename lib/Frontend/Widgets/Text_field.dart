import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final Color bgColor1;

  const LoginTextField({
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.bgColor1,
    this.isPassword = false,
  });

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      // Update the state to trigger the rebuild when focus changes
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool hasFocus = _focusNode.hasFocus;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: hasFocus
                  ? widget.bgColor1.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: widget.controller,
          cursorColor: widget.bgColor1,
          onChanged: (value) {
            //search(value);
          },
          obscureText: widget.isPassword,
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
            hintText: widget.hintText,
            border: InputBorder.none, // Remove default border
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      // Toggle password visibility
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: widget.bgColor1,
                    ),
                  )
                : null,
            errorText: null,
          ),
        ),
      ),
    );
  }
}
