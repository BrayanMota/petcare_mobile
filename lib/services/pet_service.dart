import 'dart:convert';

import 'package:http/http.dart';
import 'package:petcare/models/pet.dart';
import 'package:petcare/repositories/pet_repository.dart';

class PetService {
  final PetRepository _petRepository = PetRepository();

  Future<List<Pet>> list() async {
    try {
      Response response = await _petRepository.list();
      String body = response.body;
      Map<String, dynamic> json = jsonDecode(body);
      return Pet.listFromJson(json);
    } catch (e) {
      throw Exception('Problema ao consultar os pets');
    }
  }

  Future<String> insert(Pet pet) async {
    try {
      String json = jsonEncode(pet.toJson());
      Response response = await _petRepository.insert(json);
      String body = response.body;
      return jsonEncode(body);
    } catch (e) {
      throw Exception('Problema ao inserir o pet');
    }
  }

  Future<Pet> show(String id) async {
    try {
      Response response = await _petRepository.show(id);
      String body = response.body;
      Map<String, dynamic> json = jsonDecode(body);
      return Pet.fromJson(json);
    } catch (e) {
      throw Exception('Problema ao consultar os dados');
    }
  }

  Future<Pet> update(String id, Pet pet) async {
    try {
      String json = jsonEncode(pet.toJson());
      Response response = await _petRepository.update(id, json);
      String body = response.body;
      Map<String, dynamic> updatedPet = jsonDecode(body);
      return Pet.fromJson(updatedPet);
    } catch (e) {
      throw Exception('Problema ao atualizar o pet');
    }
  }

  Future<bool> delete(String id) async {
    try {
      Response response = await _petRepository.delete(id);
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Problema ao atualizar o pet');
    }
  }
}
