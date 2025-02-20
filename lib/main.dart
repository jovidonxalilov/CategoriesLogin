
import 'package:categorylogin/core/client.dart';
import 'package:categorylogin/utils.dart';
import 'package:flutter/material.dart';

import 'Login/category_page_column.dart';
import 'Login/category_page_sized_box.dart';
import 'Login/data/repository/auth_repository.dart';
import 'Login/presentation/pages/login_view_model.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

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

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    super.key,
    required this.vm,
  });

  final LoginViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.bacround,
        appBar: AppBar(
          backgroundColor: AppColors.bacround,
          title: Center(
            child: Text(
              'Login',
              style: TextStyle(
                color: AppColors.redpinkmain,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: ListView(
            children: [
              Form(
                key: vm.formKey,
                child: CategoryPageSizedBox(
                  hintText: "example@gmail.com",
                  validator: (value) => null,
                  controller: vm.loginController,
                ),
              ),
              CategoryPageColumn(controller: vm.passwordController),
              SizedBox(height: 90),
              if (vm.hasError)
                Text(vm.errorMessage!, style: TextStyle(color: Theme.of(context).colorScheme.error),),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (vm.formKey.currentState!.validate()) {
                        if (await vm.login() && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Urraaaaa malumot keldi"),
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.redpinkmain,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 180,
                    height: 41,
                    decoration: BoxDecoration(
                        color: AppColors.redpink,
                        borderRadius: BorderRadius.circular(150)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
