import 'dart:convert';
import 'package:guia_moteis_app/data/models/motel_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl1 = 'https://jsonkeeper.com/b/1IXK';
  final String baseUrl2 = 'https://www.npoint.io/docs/e728bb91e0cd56cc0711';

  Future<List<Motel>> fetchMotels() async {
    try {
      final response = await http.get(Uri.parse(baseUrl1));
      print(response);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['sucesso'] == true) {
          final List<dynamic> moteisJson = responseData['data']['moteis'] ?? [];
          return moteisJson.map((json) => Motel.fromJson(json)).toList();
        } else {
          throw Exception('Erro no JSON: ${responseData['mensagem']}');
        }
      } else {
        throw Exception('Falha ao carregar dados: Status ${response.statusCode}');
      }
    } catch (e) {
      return [];
    }
  }
}
