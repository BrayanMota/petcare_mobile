import 'package:flutter/material.dart';
import 'package:petcare/utils/custom_colors.dart';
import 'dart:math';
import '../models/pet.dart';

class PetListItem extends StatelessWidget {
  final Pet pet;
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PetListItem({
    super.key,
    required this.pet,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin:
          const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
            vertical: 12, horizontal: 12),
        leading: CircleAvatar(
          backgroundColor: CustomColors.primaryColor,
          radius: 25,
          child: Text(
            pet.name[0],
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          pet.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '${pet.type} - ${pet.breed}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Idade: ${pet.age} anos | Peso: ${pet.weight} kg',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        onTap: onView,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              ),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
