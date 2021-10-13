class ModeloModel {
  List<Modelos>? modelos;
  List<Anos>? anos;

  ModeloModel({this.modelos, this.anos});

  ModeloModel.fromJson(Map<String, dynamic> json) {
    if (json['modelos'] != null) {
      modelos = <Modelos>[];
      json['modelos'].forEach((v) {
        modelos?.add(new Modelos.fromJson(v));
      });
    }
    if (json['anos'] != null) {
      anos = <Anos>[];
      json['anos'].forEach((v) {
        anos?.add(new Anos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.modelos != null) {
      data['modelos'] = this.modelos?.map((v) => v.toJson()).toList();
    }
    if (this.anos != null) {
      data['anos'] = this.anos?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Modelos {
  String? nome;
  int? codigo;

  Modelos({this.nome, this.codigo});

  Modelos.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    codigo = json['codigo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['codigo'] = this.codigo;
    return data;
  }
}

class Anos {
  String? nome;
  String? codigo;

  Anos({this.nome, this.codigo});

  Anos.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    codigo = json['codigo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['codigo'] = this.codigo;
    return data;
  }
}
