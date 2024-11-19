import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color? backgroundColour, textColour;
  final VoidCallback onPressed;
  final String text;
  final double width;

  const PrimaryButton(
      {super.key,
        this.backgroundColour,
        this.textColour,
        required this.onPressed,
        required this.text,
        required this.width});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: backgroundColour ?? const Color(0xffdcdaf5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.symmetric(horizontal: width, vertical: 10)),
      child: Text(
        text,
        style: TextStyle(
            color: textColour ?? Colors.black,
            fontSize: 17,
            fontFamily: 'Roboto'), // Text color
      ),
    );
  }
}
