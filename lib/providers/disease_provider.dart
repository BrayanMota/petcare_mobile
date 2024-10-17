import 'package:flutter/material.dart';
import 'package:petcare/models/disease.dart';
import 'package:petcare/services/disease_service.dart';

class DiseaseProvider with ChangeNotifier {
  final DiseaseService _diseaseService = DiseaseService();
  List<Disease> _diseases = [];

  Future<List<Disease>> list() async {
    if (_diseases.isEmpty) {
      _diseases = await _diseaseService.list();
    }

    return _diseases;
  }

  Future<Disease> read(String id) => _diseaseService.show(id);
}

class PresentationDiseaseProvider with ChangeNotifier {
  final PresentationDiseaseService _presentationDiseaseService = PresentationDiseaseService();
  List<PresentationDisease> _presentationDiseases = [];

  Future<List<PresentationDisease>> list(String id) async {
    if (_presentationDiseases.isEmpty) {
      _presentationDiseases = await _presentationDiseaseService.list(id);
    }

    return _presentationDiseases;
  }

  // Future<PresentationDisease> read(String id) => _presentationDiseaseService.show(id);
}
