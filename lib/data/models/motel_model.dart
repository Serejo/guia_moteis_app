import 'package:guia_moteis_app/data/models/suite_model.dart';

class Motel {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final double media;
  final int qtdAvaliacoes;
  final List<Suite> suites;

  Motel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.media,
    required this.qtdAvaliacoes,
    required this.suites,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      fantasia: json['fantasia'],
      logo: json['logo'],
      bairro: json['bairro'],
      distancia: (json['distancia'] as num).toDouble(),
      qtdFavoritos: json['qtdFavoritos'],
      media: (json['media'] as num).toDouble(),
      qtdAvaliacoes: json['qtdAvaliacoes'],
      suites: (json['suites'] as List<dynamic>).map((suite) => Suite.fromJson(suite)).toList(),
    );
  }
}
