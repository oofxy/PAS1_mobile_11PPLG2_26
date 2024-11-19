import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText, labelText;
  final bool isObscured;
  final IconData? iconShow;
  final IconData? iconHide;
  final VoidCallback? onPressed;
  final TextEditingController? controller;
  final void Function(String) onChanged;

  const CustomTextField(
      {super.key,
        required this.hintText,
        required this.labelText,
        required this.isObscured,
        this.iconShow,
        this.iconHide,
        this.onPressed,
        this.controller,
        required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: isObscured,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
        labelText: labelText,
        labelStyle: const TextStyle(fontFamily: 'Roboto'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isObscured ? iconHide : iconShow,
            size: 20,
          ),
          onPressed: onPressed,
        ),
      ),
      style: const TextStyle(
          fontFamily: 'Roboto'
      ),
    );
  }
}
