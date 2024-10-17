class Disease {
  String? id;
  String nome;
  String descricao;
  String sinaisClinicos;
  String transmissao;
  String tratamentos;

  Disease({
    required this.nome,
    required this.descricao,
    required this.sinaisClinicos,
    required this.transmissao,
    required this.tratamentos,
  });

  Disease.withId({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.sinaisClinicos,
    required this.transmissao,
    required this.tratamentos,
  });

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'descricao': descricao,
        'sinais_clinicos': sinaisClinicos,
        'transmissao': transmissao,
        'tratamentos': tratamentos,
      };

  Disease.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        descricao = json['descricao'],
        sinaisClinicos = json['sinais_clinicos'],
        transmissao = json['transmissao'],
        tratamentos = json['tratamentos'];

  static List<Disease> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((item) => Disease.fromJson(item)).toList();
  }
}

class PresentationDisease {
  String? id;
  String doenca;
  int ordem;
  String tipo;
  String? texto;
  String? imagem;

  PresentationDisease({
    required this.doenca,
    required this.ordem,
    required this.tipo,
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
        tipo = json['tipo_conteudo'],
        texto = json['conteudo_texto'],
        imagem = json['conteudo_imagem'];

  static List<PresentationDisease> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((item) => PresentationDisease.fromJson(item)).toList();
  }
}
