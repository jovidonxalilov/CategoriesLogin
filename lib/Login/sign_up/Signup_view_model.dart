import 'package:categorylogin/Login/data/repository/auth_repository.dart';
import 'package:categorylogin/Login/presentation/pages/SignUpViewModel.dart';
import 'package:categorylogin/Login/sign_up/date_picker.dart';
import 'package:categorylogin/Login/sign_up/sign_up_page_dialog.dart';
import 'package:categorylogin/Login/sign_up/sign_up_view.dart';
import 'package:categorylogin/core/client.dart';
import 'package:categorylogin/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../main.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(
        vm: SignUpViewModel(
          authRepo: AuthRepository(
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
    return Scaffold(
      backgroundColor: AppColors.bacround,
      appBar: AppBar(
        backgroundColor: AppColors.bacround,
        leading: Center(
          child: IconButton(
            icon: SvgPicture.asset(
              'asset/back.svg',
              width: 30,
              height: 20,
              fit: BoxFit.cover,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginView(),
                ),
              );
            },
          ),
        ),
        title: Text(
          "Sign Up",
          style: TextStyle(color: AppColors.pink, fontSize: 22),
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
                  title: "First Name",
                  hintText: "Jovidon Xalilov",
                  validator: (value) => null,
                  controller: vm.firstNameController,
                ),
                SizedBox(height: 10),
                SignUpView(
                  title: "Last Name",
                  hintText: "Xalilov",
                  validator: (value) => null,
                  controller: vm.lastNameController,
                ),
                SignUpView(
                  title: "UserName",
                  hintText: "jovidon777",
                  validator: (value) => null,
                  controller: vm.userNameController,
                ),
                SizedBox(height: 10),
                SignUpView(
                  title: "Email",
                  hintText: "xalilovjovidon777@gmail.com",
                  validator: (value) => null,
                  controller: vm.emailController,
                ),
                SizedBox(height: 10),
                SignUpView(title: "Phone Number",
                  hintText: "+998337276008",
                  validator: (value) => null,
                  controller: vm.numberController,),
                SizedBox(height: 10),
                DatePickerTextField(title: "sana", vm: vm),
                SizedBox(height: 10),
                SignUpView(
                  title: "Password",
                  hintText: "●●●●●●●●",
                  validator: (value) => null,
                  controller: vm.passwordController,
                ),
                SizedBox(height: 10),
                SignUpView(
                  controller: vm.confirmPasswordController,
                  title: "Password",
                  hintText: "●●●●●●●●",
                  validator: (value) {
                    if (vm.passwordController.text != vm.confirmPasswordController.text) {
                      return "Passwords do not match!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                Text(
                  "By continuing, you agree to\nTerms of Use and Privacy Policy.",
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
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.redpinkmain),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
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
                        "Already have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                      Text(
                        " Log In",
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
