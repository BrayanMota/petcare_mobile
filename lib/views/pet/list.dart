import 'package:flutter/material.dart';
import 'package:petcare/components/custom_appbar.dart';
import 'package:petcare/components/custom_drawer.dart';
import 'package:petcare/components/custom_messages.dart';
import 'package:petcare/components/custom_progress_indicator.dart';
import 'package:petcare/providers/pet_provider.dart';
import 'package:petcare/routes.dart';
import 'package:petcare/utils/custom_colors.dart';
import 'package:provider/provider.dart';
import '../../../models/pet.dart';
import '../../../components/pet_list_item.dart';
import '../../../data/mock_data.dart';

class ListPetsPage extends StatefulWidget {
  const ListPetsPage({super.key});

  @override
  _ListPetsPageState createState() => _ListPetsPageState();
}

class _ListPetsPageState extends State<ListPetsPage> {
  Widget listBuider(BuildContext context, List<Pet> pets) {
    PetProvider petProvider = Provider.of<PetProvider>(context);
    return ListView.builder(
      itemCount: pets.length,
      itemBuilder: (context, index) {
        return PetListItem(
          pet: pets[index],
          onView: () {
            Navigator.of(context)
                .pushNamed(RoutePaths.viewPet, arguments: pets[index].id);
          },
          onEdit: () {
            Navigator.of(context)
                .pushNamed(RoutePaths.updatePet, arguments: pets[index]);
          },
          onDelete: () {
            petProvider.delete(pets[index].id!);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    PetProvider petProvider = Provider.of<PetProvider>(context);

    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: const CustomAppBar(
          title: 'Meus Pets',
        ),
        body: FutureBuilder<List<Pet>>(
          future: petProvider.list(),
          builder: (context, snapshot) {
            final connState = snapshot.connectionState;
            const connWaiting = ConnectionState.waiting;
            if (connState == connWaiting) {
              return circularProgress();
            } else if (snapshot.hasError) {
              return errorMessage('${snapshot.error}');
            } else if (snapshot.hasData) {
              return listBuider(context, snapshot.data!);
            } else {
              return errorMessage('Sem dados disponiveis.');
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              RoutePaths.createPet,
            );
          },
          backgroundColor: CustomColors.primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
