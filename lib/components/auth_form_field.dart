import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  final bool obscureText;
  final Icon icon;

  const AuthFormField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        validator: (value) {
          if (value == "" || value == null || value.isEmpty) {
            return "Campo Obrigatório";
          }
          return null;
        },
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: icon,
        ),
      ),
    );
  }
}
