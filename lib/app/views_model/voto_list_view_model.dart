import 'dart:convert';

class VotoListViewModel {
  int votocd;

  VotoListViewModel({
    required this.votocd,
  });

  Map<String, dynamic> toMap() {
    return {
      'votocd': votocd,
    };
  }

  factory VotoListViewModel.fromMap(Map<String, dynamic> map) {
    return VotoListViewModel(
      votocd: map['votocd']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory VotoListViewModel.fromJson(String source) =>
      VotoListViewModel.fromMap(json.decode(source));
}
