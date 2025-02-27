import 'package:flutter/material.dart';
import '../../../data/repository/LogInRepository.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required AuthRepository repo}) : _repo = repo;

  final AuthRepository _repo;

  String? _errorMessage;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;

  final formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> login() async {
    try {
      clearError();
      await _repo.login(loginController.text, passwordController.text);
    } on Exception catch (e) {
      setError(e.toString());
      return false;
    }
    return true;
  }

  void setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
