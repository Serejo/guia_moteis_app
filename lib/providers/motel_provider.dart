import 'package:flutter/material.dart';
import '../data/api_client.dart';
import '../data/models/motel.dart';

class MotelProvider extends ChangeNotifier {
  List<Motel> _motels = [];
  bool _isLoading = true;
  String? _errorMessage;

  List<Motel> get motels => _motels;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final ApiClient _apiClient = ApiClient();

  Future<void> loadMotels() async {
    try {
      _isLoading = true;
      notifyListeners();

      _motels = await _apiClient.fetchMotels();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Erro ao carregar motéis';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
