import 'package:categorylogin/core/client.dart';
import 'package:flutter/material.dart';

import 'Login/data/repository/auth_repository.dart';
import 'Login/login_view.dart';
import 'Login/presentation/pages/login_view_model.dart';

void main() {
  runApp(LoginView());
}

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryPage(
        vm: LoginViewModel(
          repo: AuthRepository(
            client: ApiClient(),
          ),
        ),
      ),
    );
  }
}


