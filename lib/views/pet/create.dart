import 'package:flutter/material.dart';
import 'package:petcare/components/custom_drawer.dart';
import 'package:petcare/routes.dart';
import 'package:petcare/utils/custom_colors.dart';

import '../../components/custom_appbar.dart';
import '../../components/pet_form_field.dart';
import '../../data/mock_data.dart';
import '../../models/pet.dart';

class CreatePetPage extends StatefulWidget {
  const CreatePetPage({super.key});

  @override
  _CreatePetPageState createState() => _CreatePetPageState();
}

class _CreatePetPageState extends State<CreatePetPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void addNewPet() {
      if (_formKey.currentState!.validate()) {
        List<Pet> pets = mockPets;
        String lastID = pets.last.id;
        String nextID = (int.parse(lastID) + 1).toString();
        final newPet = Pet(
          id: nextID,
          name: _nameController.text,
          breed: _breedController.text,
          type: _typeController.text,
          age: int.parse(_ageController.text),
          ownerName: _ownerNameController.text,
          weight: double.parse(_weightController.text),
        );
        pets.add(newPet);
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutePaths.home,
          (route) => false,
        );
      }
    }

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(
        title: 'Adicionar Pet',
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              PetFormField(label: 'Nome', controller: _nameController),
              PetFormField(label: 'Raça', controller: _breedController),
              PetFormField(label: 'Tipo', controller: _typeController),
              PetFormField(
                label: 'Idade',
                controller: _ageController,
                keyboardType: TextInputType.number,
              ),
              PetFormField(label: 'Dono', controller: _ownerNameController),
              PetFormField(
                label: 'Peso(kg)',
                controller: _weightController,
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
                    onPressed: addNewPet,
                    child: const Text(
                      'Salvar',
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
    );
  }
}
