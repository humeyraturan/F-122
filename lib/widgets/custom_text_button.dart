import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;
  const CustomTextButton({super.key, 
  required this.onPressed, 
  required this.buttonText, 
  required this.textColor
});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  late String buttonText;
  
  get textColor => null;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, "/signUp"),
      child: Text(buttonText, style: TextStyle(color: textColor),
      ),
    );
  }
}
