import 'package:http/http.dart' as http;

class DiseaseRepository {
  // Para Android Emulator, use 10.0.2.2, senão mantenha 127.0.0.1 para testes locais no iOS ou no navegador.
  final _baseUrl =
      'http://10.0.2.2:9000/doenca/api/v1'; // Mude para o IP da rede local se estiver testando em dispositivos físicos
  final String _resource = 'doenca_readonly';

  Future<http.Response> list() {
    final uri = '$_baseUrl/$_resource';
    return http.get(Uri.parse(uri));
  }

  Future<http.Response> show(String id) {
    final uri = '$_baseUrl/$_resource/$id';
    return http.get(Uri.parse(uri));
  }
}

class PresentationDiseaseRepository {
  // Para Android Emulator, use 10.0.2.2, senão mantenha 127.0.0.1 para testes locais no iOS ou no navegador.
  final _baseUrl =
      'http://10.0.2.2:9000/doenca/api/v1'; // Mude para o IP da rede local se estiver testando em dispositivos físicos
  final String _resource = 'apresentacao_readonly';

  // Future<http.Response> list() {
  //   final uri = '$_baseUrl/$_resource';
  //   return http.get(Uri.parse(uri));
  // }

  Future<http.Response> show(String id) {
    final uri = '$_baseUrl/$_resource/?doenca=$id';
    return http.get(Uri.parse(uri));
  }
}
