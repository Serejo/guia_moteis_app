import 'package:flutter/material.dart';
import 'package:guia_moteis_app/presentation/widgets/filter_widget.dart';
import '../data/api_client.dart';
import '../data/models/motel_model.dart';

class MotelProvider extends ChangeNotifier {
  List<Motel> _motels = [];
  bool _isLoading = true;
  String? _errorMessage;
  List<int> _selectedFilterIndices = [];

  List<FilterItem> filters = [
    FilterItem(text: 'filtros', icon: Icons.tune),
    FilterItem(text: 'com desconto'),
    FilterItem(text: 'disponíveis'),
    FilterItem(text: 'hidro'),
    FilterItem(text: 'piscina'),
    FilterItem(text: 'sauna'),
    FilterItem(text: 'ofurô'),
    FilterItem(text: 'decoração erótica'),
    FilterItem(text: 'pernoite'),
  ];

  List<Motel> get motels => _motels;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<int> get selectedFilterIndices => _selectedFilterIndices;

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

  void toggleFilter(int index) {
    if (index == 0) return; // Ignora o primeiro filtro fixo

    if (_selectedFilterIndices.contains(index)) {
      _selectedFilterIndices.remove(index);
    } else {
      _selectedFilterIndices.add(index);
    }

    notifyListeners();
  }
}
