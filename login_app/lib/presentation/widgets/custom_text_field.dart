import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback? toggleVisibility;
  final TextInputType keyboardType;
  final BorderRadius borderRadiusEnabled;
  final BorderRadius borderRadiusFocus;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.toggleVisibility,
    this.keyboardType = TextInputType.text,
    this.borderRadiusEnabled  = const BorderRadius.all(Radius.circular(30)),
    this.borderRadiusFocus    = const BorderRadius.all(Radius.circular(30)),
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white), 
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        suffixIcon: toggleVisibility != null
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: toggleVisibility,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadiusEnabled,
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadiusFocus,
          borderSide: const BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.transparent, 
      ),
    );
  }
}