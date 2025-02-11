import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_app/data/models/motel_model.dart';

void main() {
  test('Deve converter JSON para um objeto Motel corretamente', () {
    final json = {"fantasia": "Motel Le Nid", "bairro": "Chácara Flora - São Paulo", "distancia": 28.27};

    final motel = Motel.fromJson(json);

    expect(motel.fantasia, equals("Motel Le Nid"));
    expect(motel.bairro, equals("Chácara Flora - São Paulo"));
    expect(motel.distancia, equals(28.27));
  });

  test('Deve converter JSON para um objeto Motel com valores padrão', () {
    final json = {"fantasia": "Motel Le Nid", "bairro": "Chácara Flora - São Paulo"};

    final motel = Motel.fromJson(json);

    expect(motel.fantasia, equals("Motel Le Nid"));
    expect(motel.bairro, equals("Chácara Flora - São Paulo"));
    expect(motel.distancia, equals(0.0));
    expect(motel.qtdFavoritos, equals(0));
    expect(motel.media, equals(0.0));
    expect(motel.qtdAvaliacoes, equals(0));
    expect(motel.suites, isEmpty);
  });

  test('Deve converter JSON para um objeto Motel com suites', () {
    final json = {
      "fantasia": "Motel Le Nid",
      "bairro": "Chácara Flora - São Paulo",
      "distancia": 28.27,
      "suites": [
        {"nome": "Suite 1", "preco": 100.0, "qtd": 3},
        {"nome": "Suite 2", "preco": 150.0, "qtd": 0}
      ]
    };

    final motel = Motel.fromJson(json);

    expect(motel.fantasia, equals("Motel Le Nid"));
    expect(motel.bairro, equals("Chácara Flora - São Paulo"));
    expect(motel.distancia, equals(28.27));
    expect(motel.suites.length, equals(2));
    expect(motel.suites[0].nome, equals("Suite 1"));
    expect(motel.suites[0].qtd, equals(3));
    expect(motel.suites[1].nome, equals("Suite 2"));
  });
}
