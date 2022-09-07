import 'dart:convert';

class Eleitor {
  final int id;
  final String name;
  final String partido;
  final String image;
  final int votos;

  Eleitor({
    required this.id,
    required this.name,
    required this.partido,
    required this.image,
    required this.votos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'partido': partido,
      'image': image,
      'votos': votos,
    };
  }

  factory Eleitor.fromMap(Map<String, dynamic> map) {
    return Eleitor(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      partido: map['partido'] ?? '',
      image: map['image'] ?? '',
      votos: map['votos']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Eleitor.fromJson(String source) => Eleitor.fromMap(json.decode(source));
}
