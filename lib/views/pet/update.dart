import 'package:flutter/material.dart';
import 'package:petcare/utils/custom_colors.dart';

import '../../components/custom_appbar.dart';
import '../../components/pet_form_field.dart';
import '../../models/pet.dart';

class UpdatePetPage extends StatefulWidget {
  const UpdatePetPage({super.key});

  @override
  _UpdatePetPageState createState() => _UpdatePetPageState();
}

class _UpdatePetPageState extends State<UpdatePetPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Pet pet = ModalRoute.of(context)?.settings.arguments as Pet;

    TextEditingController nameController =
        TextEditingController(text: pet.name);
    TextEditingController breedController =
        TextEditingController(text: pet.breed);
    TextEditingController typeController =
        TextEditingController(text: pet.type);
    TextEditingController ageController =
        TextEditingController(text: pet.age.toString());
    TextEditingController ownerNameController =
        TextEditingController(text: pet.ownerName);
    TextEditingController weightController =
        TextEditingController(text: pet.weight.toString());

    void updatePet() {
      if (_formKey.currentState!.validate()) {
        setState(() {
          pet.name = nameController.text;
          pet.breed = breedController.text;
          pet.type = typeController.text;
          pet.age = int.parse(ageController.text);
          pet.ownerName = ownerNameController.text;
          pet.weight = double.parse(weightController.text);
        });

        Navigator.pushNamedAndRemoveUntil(
          context,
          '/',
          (route) => false,
        );
      }
    }

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Atualizar Pet',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                PetFormField(
                  label: 'Nome',
                  controller: nameController,
                ),
                PetFormField(
                  label: 'Raça',
                  controller: breedController,
                ),
                PetFormField(
                  label: 'Tipo',
                  controller: typeController,
                ),
                PetFormField(
                  label: 'Idade',
                  controller: ageController,
                  keyboardType: TextInputType.number,
                ),
                PetFormField(
                  label: 'Dono',
                  controller: ownerNameController,
                ),
                PetFormField(
                  label: 'Peso (kg)',
                  controller: weightController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    ElevatedButton(
                      onPressed: updatePet,
                      child: const Text(
                        'Atualizar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
