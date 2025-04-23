import 'package:categorylogin/core/client.dart';
import 'package:categorylogin/core/utils.dart';
import 'package:categorylogin/recipe_app/sign_up/presentation/view/SignUpViewModel.dart';
import 'package:categorylogin/recipe_app/sign_up/presentation/widget/SignUpTexFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/l10n/app_localization.dart';
import '../../../core/rout/routes.dart';
import '../../../main.dart';
import '../../Login/presentation/login_view.dart';
import '../data/repository/SignUpRepository.dart';
import 'widget/date_picker.dart';

// void main() {
//   runApp(SignUp());
// }

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          MyLocalizations.delegate,
        ],
        supportedLocales: [Locale("uz"), Locale("en"), Locale("ru")],
        locale: context.watch<LocalizationViewModel>().currentLocale,
        home: SignUpPage(
          vm: SignUpViewModel(
            authRepo: SignUpRepository(
              client: ApiClient(),
            ),
          ),
        ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
    required this.vm,
  });

  final SignUpViewModel vm;

  @override
  Widget build(BuildContext context) {
    context.watch<LocalizationViewModel>().currentLocale;
    return Scaffold(
      backgroundColor: AppColors.bacround,
      appBar: AppBar(
        backgroundColor: AppColors.bacround,
        leading: Center(
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/back.svg',
              width: 30,
              height: 20,
              fit: BoxFit.cover,
            ),
            onPressed: () {
             context.push(Routes.login);
            },
          ),
        ),
        title: Center(
          child: Text(
            MyLocalizations.of(context)!.signup,
            style: TextStyle(color: AppColors.pink, fontSize: 22),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignUpView(
                  title: MyLocalizations.of(context)!.firstName,
                  hintText: "Jovidon Xalilov",
                  validator: (value) => null,
                  controller: vm.firstNameController,
                ),
                SizedBox(height: 10),
                SignUpView(
                  title: MyLocalizations.of(context)!.lastName,
                  hintText: "Xalilov",
                  validator: (value) => null,
                  controller: vm.lastNameController,
                ),
                SignUpView(
                  title: MyLocalizations.of(context)!.username,
                  hintText: "jovidon777",
                  validator: (value) => null,
                  controller: vm.userNameController,
                ),
                SizedBox(height: 10),
                SignUpView(
                  title: MyLocalizations.of(context)!.email,
                  hintText: "xalilovjovidon777@gmail.com",
                  validator: (value) => null,
                  controller: vm.emailController,
                ),
                SizedBox(height: 10),
                SignUpView(
                  title: MyLocalizations.of(context)!.phone,
                  hintText: "+998337276008",
                  validator: (value) => null,
                  controller: vm.numberController,
                ),
                SizedBox(height: 10),
                DatePickerTextField(
                    text: MyLocalizations.of(context)!.sana,
                    title: "sana",
                    vm: vm),
                SizedBox(height: 10),
                SignUpView(
                  title: MyLocalizations.of(context)!.password,
                  hintText: "●●●●●●●●",
                  validator: (value) => null,
                  controller: vm.passwordController,
                ),
                SizedBox(height: 10),
                SignUpView(
                  controller: vm.confirmPasswordController,
                  title: MyLocalizations.of(context)!.password,
                  hintText: "●●●●●●●●",
                  validator: (value) {
                    if (vm.passwordController.text !=
                        vm.confirmPasswordController.text) {
                      return "Passwords do not match!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                Text(
                  MyLocalizations.of(context)!.signmalumot,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: 194,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      vm.signUp(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redpinkmain),
                    child:  Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          MyLocalizations.of(context)!.signup,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Row(
                    children: [
                      Text(
                        MyLocalizations.of(context)!.hisob,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                      Text(
                        MyLocalizations.of(context)!.signup,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
