import 'package:flutter/material.dart';

class PetFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;

  const PetFormField(
      {super.key,
      required this.label,
      required this.controller,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        validator: (value) {
          if (value == "" || value == null || value.isEmpty) {
            return "Campo Obrigatório";
          }
          return null;
        },
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        ),
      ),
    );
  }
}
