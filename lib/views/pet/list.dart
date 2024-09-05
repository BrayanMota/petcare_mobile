import 'package:flutter/material.dart';
import 'package:petcare/components/custom_appbar.dart';
import 'package:petcare/routes.dart';
import 'package:petcare/utils/custom_colors.dart';
import '../../../models/pet.dart';
import '../../../components/pet_list_item.dart';
import '../../../data/mock_data.dart';

class ListPetsPage extends StatefulWidget {
  @override
  _ListPetsPageState createState() => _ListPetsPageState();
}

class _ListPetsPageState extends State<ListPetsPage> {
  // Usando a lista mockada
  List<Pet> pets = mockPets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Meus Pets',
      ),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return PetListItem(
            pet: pets[index],
            onView: () {
              Navigator.of(context)
                  .pushNamed(RoutePaths.viewPet, arguments: pets[index]);
            },
            onEdit: () {
              Navigator.of(context)
                  .pushNamed(RoutePaths.updatePet, arguments: pets[index]);
            },
            onDelete: () {
              setState(() {
                pets.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/create_pet');
        },
        backgroundColor: CustomColors.primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
