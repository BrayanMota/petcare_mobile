import 'package:flutter/material.dart';
import 'package:petcare/components/custom_appbar.dart';
import 'package:petcare/components/custom_drawer.dart';
import 'package:petcare/components/pet_view_item.dart';
import 'package:petcare/utils/custom_colors.dart';
import '../../models/pet.dart';

class ViewPetPage extends StatelessWidget {
  const ViewPetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Pet pet = ModalRoute.of(context)?.settings.arguments as Pet;

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        title: 'Detalhes de ${pet.name}',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: CustomColors.primaryColor,
                child: Text(
                  pet.name[0],
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PetViewItem(label: 'Nome:', value: pet.name),
                    const Divider(),
                    PetViewItem(label: 'Raça:', value: pet.breed),
                    const Divider(),
                    PetViewItem(label: 'Tipo:', value: pet.type),
                    const Divider(),
                    PetViewItem(label: 'Idade:', value: '${pet.age} anos'),
                    const Divider(),
                    PetViewItem(label: 'Dono:', value: pet.ownerName),
                    const Divider(),
                    PetViewItem(
                      label: 'Peso:',
                      value: '${pet.weight.toStringAsFixed(1)} kg',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Voltar',
                style: TextStyle(
                  color: CustomColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
