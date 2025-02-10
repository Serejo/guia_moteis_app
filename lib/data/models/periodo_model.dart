class Periodo {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final double? desconto;

  Periodo({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      tempoFormatado: json['tempoFormatado'],
      tempo: json['tempo'],
      valor: _getDoubleFromJson(json['valor']),
      valorTotal: _getDoubleFromJson(json['valorTotal']),
      temCortesia: json['temCortesia'],
      desconto: json['desconto'] != null ? _getDoubleFromJson(json['desconto']) : null,
    );
  }

  static double _getDoubleFromJson(dynamic value) {
    if (value is num) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value) ?? 0.0;
    } else {
      return 0.0;
    }
  }
}
