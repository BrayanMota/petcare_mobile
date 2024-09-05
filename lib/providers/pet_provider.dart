import 'package:flutter/material.dart';
import 'package:petcare/models/pet.dart';
import 'package:petcare/services/pet_service.dart';

class PetProvider with ChangeNotifier {
  final PetService _petService = PetService();
  List<Pet> _pets = [];

  Future<List<Pet>> list() async {
    if (_pets.isEmpty) {
      _pets = await _petService.list();
    }

    return _pets;
  }

  Future<void> create(Pet pet) {
    Future<String> future = _petService.insert(pet);
    return future.then((id) {
      pet.id = id;
      _pets.add(pet);
      notifyListeners();
    });
  }

  Future<Pet> read(String id) => _petService.show(id);

  Future<void> update(String id, Pet pet) {
    Future<Pet> future = _petService.update(id, pet);
    return future.then((newPet) {
      Iterable<Pet> filteredPet = _pets.where((element) => element.id == id);
      Pet oldPet = filteredPet.first;
      oldPet = newPet;
      notifyListeners();
    });
  }

  Future<bool> delete(String id) {
    Future<bool> future = _petService.delete(id);
    return future.then((isDeleted) {
      if (isDeleted) {
        Iterable<Pet> filteredPet = _pets.where((element) => element.id == id);
        Pet pet = filteredPet.first;
        _pets.remove(pet);
        notifyListeners();
      }
      return Future.value(isDeleted);
    });
  }
}
