import 'package:categorylogin/recipe_app/Login/presentation/login_view.dart';
import 'package:categorylogin/recipe_app/Login/presentation/view/login_view_model.dart';
import 'package:categorylogin/recipe_app/Login/presentation/widget/LogInEmail.dart';
import 'package:categorylogin/recipe_app/Login/presentation/widget/LogInPassword.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/l10n/app_localization.dart';
import '../../core/rout/routes.dart';
import '../../core/utils.dart';
import '../categories/presentation/page/category_view.dart';
import '../sign_up/presentation/SignUpPage.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();
    // final vam = context.watch<LocalizationViewModel>();
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.bacround,
        appBar: AppBar(
          backgroundColor: AppColors.bacround,
          title: Center(
            child: Text(
              MyLocalizations.of(context)!.login,
              style: TextStyle(
                color: AppColors.redpinkmain,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopupMenuButton<String>(
                icon: Icon(Icons.language, color: Colors.white, weight: 14),
                onSelected: (String value) {
                  final localeVM = context.read<LocalizationViewModel>();
                  if (value == 'Oʻzbekcha') {
                    localeVM.setLocale(Locale("uz"));
                  } else if (value == 'English') {
                    localeVM.setLocale(Locale("en"));
                  } else if (value == 'Русский') {
                    localeVM.setLocale(Locale("ru"));
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Oʻzbekcha',
                    child: Text('Oʻzbekcha 🇺🇿'),
                  ),
                  PopupMenuItem<String>(
                    value: 'English',
                    child: Text("English 🇺🇸"),
                  ),
                  PopupMenuItem<String>(
                    value: 'Русский',
                    child: Text('Русский 🇷🇺'),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: ListView(
            children: [
              Form(
                key: vm.formKey,
                child: CategoryPageSizedBox(
                  hintText: MyLocalizations.of(context)!.email,
                  email: MyLocalizations.of(context)!.email,
                  validator: (value) => null,
                  controller: vm.loginController,
                ),
              ),
              SizedBox(height: 10),
              CategoryPageColumn(
                controller: vm.passwordController,
                title: MyLocalizations.of(context)!.password,
                hint: "●●●●●●●●",
              ),
              SizedBox(height: 90),
              if (vm.hasError)
                Text(
                  vm.errorMessage!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              Column(
                children: [
                  Column(
                    children: [
                      if (vm.hasError)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      SizedBox(
                        width: 207,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (vm.formKey.currentState!.validate()) {
                              bool isSuccess = await vm.login();

                              if (isSuccess && context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(MyLocalizations.of(context)!
                                        .logintasdiq),
                                  ),
                                );
                                context.push(Routes.categories);
                              } else {
                                vm.setError(
                                    "MyLocalizations.of(context)!.loginerror");
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.redpink,
                          ),
                          child: Center(
                            child: Text(
                              MyLocalizations.of(context)!.login,
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.pink,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 207,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redpink,
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            MyLocalizations.of(context)!.signup,
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.pink,
                            ),
                          ),
                        ),
                      ),
                    ),
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
