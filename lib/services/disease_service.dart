import 'dart:convert';

import 'package:http/http.dart';
import 'package:petcare/models/disease.dart';
import 'package:petcare/repositories/disease_repository.dart';

class DiseaseService {
  final DiseaseRepository _diseaseRepository = DiseaseRepository();

  Future<List<Disease>> list() async {
    try {
      Response response = await _diseaseRepository.list();
      String body = response.body;
      Map<String, dynamic> json = jsonDecode(body);
      return Disease.listFromJson(json['results']);
    } catch (e) {
      throw Exception('Problema ao consultar as doenças');
    }
  }

  Future<Disease> show(String id) async {
    try {
      Response response = await _diseaseRepository.show(id);
      String body = response.body;
      Map<String, dynamic> json = jsonDecode(body);
      return Disease.fromJson(json);
    } catch (e) {
      throw Exception('Problema ao consultar a doença');
    }
  }
}

class PresentationDiseaseService {
  final PresentationDiseaseRepository _presentationRepository =
      PresentationDiseaseRepository();

  Future<List<PresentationDisease>> list(String id) async {
    try {
      Response response = await _presentationRepository.show(id);
      String body = response.body;
      Map<String, dynamic> json = jsonDecode(body);
      return PresentationDisease.listFromJson(json['results']);
    } catch (e) {
      throw Exception('Problema ao consultar as apresentações');
    }
  }

  // Future<PresentationDisease> show(String id) async {
  //   try {
  //     Response response = await _presentationRepository.show(id);
  //     String body = response.body;
  //     Map<String, dynamic> json = jsonDecode(body);
  //     return PresentationDisease.fromJson(json);
  //   } catch (e) {
  //     throw Exception('Problema ao consultar a doença');
  //   }
  // }
}
