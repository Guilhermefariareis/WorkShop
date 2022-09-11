import 'dart:convert';

class Voto {
  final int idVoto;
  final int id;
  final int idade;
  final String cidade;
  final String uf;

  Voto({
    required this.idVoto,
    required this.id,
    required this.idade,
    required this.cidade,
    required this.uf,
  });

  Map<String, dynamic> toMap() {
    return {
      'idVoto': idVoto,
      'id': id,
      'idade': idade,
      'cidade': cidade,
      'uf': uf,
    };
  }

  factory Voto.fromMap(Map<String, dynamic> map) {
    return Voto(
      idVoto: map['idVoto']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      idade: map['idade']?.toInt() ?? 0,
      cidade: map['cidade'] ?? '',
      uf: map['uf'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Voto.fromJson(String source) => Voto.fromMap(json.decode(source));
}
