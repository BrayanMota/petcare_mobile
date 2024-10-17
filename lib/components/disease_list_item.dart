import 'package:flutter/material.dart';
import 'package:petcare/models/disease.dart';
import 'package:petcare/utils/custom_colors.dart';

class DiseaseListItem extends StatelessWidget {
  final Disease disease;
  final VoidCallback onView;

  const DiseaseListItem({
    super.key,
    required this.disease,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        leading: CircleAvatar(
          backgroundColor: CustomColors.primaryColor,
          radius: 25,
          child: Text(
            disease.nome[0],
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          disease.nome,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: onView,
      ),
    );
  }
}
