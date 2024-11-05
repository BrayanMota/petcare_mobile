class Disease {
  String? id;
  String nome;
  String descricao;
  String? imagem;

  Disease({
    required this.nome,
    required this.descricao,
    required this.imagem,
  });

  Disease.withId({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.imagem,
  });

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'descricao': descricao,
        'imagem': imagem,
      };

  Disease.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        descricao = json['descricao'],
        imagem = json['imagem'];

  static List<Disease> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((item) => Disease.fromJson(item)).toList();
  }
}

class PresentationDisease {
  String? id;
  String doenca;
  int ordem;
  String tipo;
  String topico;
  String? texto;
  String? imagem;

  PresentationDisease({
    required this.doenca,
    required this.ordem,
    required this.tipo,
    required this.topico,
    this.texto = '',
    this.imagem = '',
  });

  // Map<String, dynamic> toJson() => {
  //       'doenca': doenca,
  //       'ordem': ordem,
  //       'sinais_clinicos': tipo,
  //       'texto': texto,
  //       'imagem': imagem,
  //     };

  PresentationDisease.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        doenca = json['doenca'],
        ordem = json['ordem'],
        topico = json['topico'],
        tipo = json['tipo_conteudo'],
        texto = json['conteudo_texto'],
        imagem = json['conteudo_imagem'];

  static List<PresentationDisease> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((item) => PresentationDisease.fromJson(item)).toList();
  }
}
