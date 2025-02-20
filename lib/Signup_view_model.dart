import 'package:categorylogin/sign_up_view.dart';
import 'package:categorylogin/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SignUpPage(
//         title: "fguuf",
//         page: "uyhgufv",
//       ),
//     );
//   }
// }

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
  });

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
                MaterialPageRoute(builder: (context) =>
                    Login()),
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
                SignUpView(title: "John Doe", page: "Full name"),
                SizedBox(height: 10),
                SignUpView(title: "example@example.com", page: "Email"),
                SizedBox(height: 10),
                SignUpView(title: "+ 123 456 789", page: "Mobile Number"),
                SizedBox(height: 10),
                SignUpView(title: "DD / MM /YYY", page: "Date of birth"),
                SizedBox(height: 10),
                SignUpView(title: "●●●●●●●●", page: "Password"),
                SizedBox(height: 10),
                SignUpView(title: "●●●●●●●●", page: "Confirm Password"),
                SizedBox(height: 25),
                Text(
                  "By continuing, you agree to\nTerms of Use and Privacy Policy.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: 194,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.pink,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
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
