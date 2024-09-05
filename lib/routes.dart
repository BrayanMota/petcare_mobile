import 'package:flutter/material.dart';
import 'views/pet/list.dart';
import 'views/pet/create.dart';
import 'views/pet/view.dart';
import 'views/pet/update.dart';

class RoutePaths {
  static const String home = '/';
  static const String createPet = '/create_pet';
  static const String viewPet = '/view_pet';
  static const String updatePet = '/update_pet';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => ListPetsPage(),
      createPet: (context) => const CreatePetPage(),
      viewPet: (context) => const ViewPetPage(),
      updatePet: (context) => const UpdatePetPage(),
    };
  }
}
