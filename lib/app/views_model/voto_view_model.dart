import 'voto_list_view_model.dart';
import 'dart:convert';

class VotoViewModel {
  int idVoto;
  int id;
  int idade;
  String cidade;
  String uf;

  VotoViewModel({
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

  factory VotoViewModel.fromMap(Map<String, dynamic> map) {
    return VotoViewModel(
      idVoto: map['idVoto']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      idade: map['idade']?.toInt() ?? 0,
      cidade: map['cidade'] ?? '',
      uf: map['uf'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VotoViewModel.fromJson(String source) =>
      VotoViewModel.fromMap(json.decode(source));
}
