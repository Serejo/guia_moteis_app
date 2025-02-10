import 'dart:convert';
import 'package:guia_moteis_app/data/models/motel.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl1 = 'https://jsonkeeper.com/b/1IXK';
  final String baseUrl2 = 'https://www.npoint.io/docs/e728bb91e0cd56cc0711';

  Future<List<Motel>> fetchMotels() async {
    final response = await http.get(Uri.parse(baseUrl1));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Motel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load motels');
    }
  }
}
