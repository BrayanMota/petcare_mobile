import 'package:flutter/material.dart';
import 'package:petcare/components/custom_appbar.dart';
import 'package:petcare/components/custom_drawer.dart';
import 'package:petcare/components/custom_messages.dart';
import 'package:petcare/components/custom_progress_indicator.dart';
import 'package:petcare/components/pet_view_item.dart';
import 'package:petcare/providers/pet_provider.dart';
import 'package:petcare/utils/custom_colors.dart';
import 'package:provider/provider.dart';
import '../../models/pet.dart';

class ViewPetPage extends StatelessWidget {
  const ViewPetPage({super.key});

  Widget petBuilder(BuildContext context, Pet pet) {
    return Padding(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final String petId = ModalRoute.of(context)?.settings.arguments as String;

    PetProvider petProvider = Provider.of<PetProvider>(context);

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(
        title: 'Detalhes',
      ),
      body: FutureBuilder<Pet>(
        future: petProvider.read(petId),
        builder: (context, snapshot) {
          final connState = snapshot.connectionState;
          const connWaiting = ConnectionState.waiting;
          if (connState == connWaiting) {
            return circularProgress();
          } else if (snapshot.hasError) {
            return errorMessage('${snapshot.error}');
          } else if (snapshot.hasData) {
            return petBuilder(context, snapshot.data!);
          } else {
            return errorMessage('Sem dado disponivel.');
          }
        },
      ),
    );
  }
}
