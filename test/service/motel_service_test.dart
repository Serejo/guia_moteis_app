import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_app/data/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'motel_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ApiClient apiClient;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    apiClient = ApiClient(httpClient: mockHttpClient);
  });

  group('fetchMotels', () {
    test('Deve lançar uma exceção ao receber status diferente de 200', () async {
      when(mockHttpClient.get(Uri.parse(apiClient.baseUrl1))).thenAnswer((_) async => http.Response('Erro', 404));

      final moteis = await apiClient.fetchMotels();

      expect(moteis, isEmpty);
    });

    test('Deve retornar lista vazia quando JSON não está no formato esperado', () async {
      const String invalidJsonResponse = '{"error": "Formato inválido"}';

      when(mockHttpClient.get(Uri.parse(apiClient.baseUrl1)))
          .thenAnswer((_) async => http.Response(invalidJsonResponse, 200));

      final moteis = await apiClient.fetchMotels();

      expect(moteis, isEmpty);
    });

    test('Deve retornar lista vazia quando JSON está vazio', () async {
      const String emptyJsonResponse =
          '{"sucesso": true, "mensagem": "Dados carregados com sucesso", "data": {"moteis": []}}';

      when(mockHttpClient.get(Uri.parse(apiClient.baseUrl1)))
          .thenAnswer((_) async => http.Response(emptyJsonResponse, 200));

      final moteis = await apiClient.fetchMotels();

      expect(moteis, isEmpty);
    });
  });
}
