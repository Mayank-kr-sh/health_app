import 'package:flutter/material.dart';

import '../Constant/Constant.dart';

import '../Widgets/custom_button.dart';

class ForgotPasswordDialog extends StatefulWidget {
  final Color bgColor1;
  final String title;
  const ForgotPasswordDialog({
    required this.bgColor1,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _ForgotPasswordDialogState createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  final bool _showSignInPage = true;
  bool _showErrorMessage = false;
  bool _showOTPInput = false;

  void _sendButtonPressed() {
    if (_showSignInPage) {
      setState(() {
        _showErrorMessage = true;
      });
    } else {
      setState(() {
        _showOTPInput = true;
      });
    }
  }

  void _backButtonPressed() {
    if (_showOTPInput) {
      setState(() {
        _showOTPInput = false;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.black54,
            ),
          ),
        ),
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_showSignInPage)
                  Column(
                    children: [
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter your registered email',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          alignLabelWithHint: true,
                          hintText: 'Your Email',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: widget.bgColor1,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 90,
                        child: CustomButton(
                          width: double.infinity,
                          height: 40,
                          text: 'Send',
                          textColor: Colors.white,
                          onPressed: _sendButtonPressed,
                          backgroundColor: widget.bgColor1,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      if (_showErrorMessage)
                        const SizedBox(
                          height: 16,
                          child: Text(
                            'Invalid email. Please enter a valid email address.',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                if (_showOTPInput)
                  Column(
                    children: [
                      const Text(
                        'Enter OTP',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter the OTP',
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Perform OTP verification action
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          backgroundColor: kPrimaryColor,
                        ),
                        child: const Text('Verify OTP'),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: _backButtonPressed,
                        child: const Text('Back'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
