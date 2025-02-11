import 'package:guia_moteis_app/data/models/categoria_item_model.dart';
import 'package:guia_moteis_app/data/models/periodo_model.dart';

class Suite {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<String> itens;
  final List<Periodo> periodos;
  final List<CategoriaItem>? categoriaItens;

  Suite({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.periodos,
    required this.categoriaItens,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      nome: json['nome'],
      qtd: json['qtd'],
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'],
      fotos: List<String>.from(json['fotos']),
      itens: (json['itens'] as List<dynamic>).map((item) => item['nome'] as String).toList(),
      periodos: (json['periodos'] as List<dynamic>).map((periodo) => Periodo.fromJson(periodo)).toList(),
      categoriaItens: (json['categoriaItens'] as List<dynamic>).map((item) => CategoriaItem.fromJson(item)).toList(),
    );
  }
}
