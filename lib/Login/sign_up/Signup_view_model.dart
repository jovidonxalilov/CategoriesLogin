import 'package:categorylogin/Login/sign_up/sign_up_view.dart';
import 'package:categorylogin/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../main.dart';

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
                MaterialPageRoute(
                  builder: (context) => Login(),
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
                SizedBox(
                  width: 194,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 82,
                                height: 82,
                                decoration: BoxDecoration(
                                  color: AppColors.redpink,
                                  borderRadius: BorderRadius.circular(41),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "asset/person.svg",
                                    width: 30,
                                    height: 45,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redpinkmain),
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
