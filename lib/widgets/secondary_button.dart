import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Color? backgroundColour, textColour;
  final VoidCallback onPressed;
  final String text;
  final double width;

  const SecondaryButton(
      {super.key,
        this.backgroundColour,
        this.textColour,
        required this.onPressed,
        required this.text,
        required this.width});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xffdcdaf5), width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.symmetric(horizontal: width, vertical: 12)),
      child: Text(
        text,
        style: TextStyle(
            color: textColour ?? Colors.white,
            fontSize: 17,
            fontFamily: 'Roboto'), // Text color
      ),
    );
  }
}
