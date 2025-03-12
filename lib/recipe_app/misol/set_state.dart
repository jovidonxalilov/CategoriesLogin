import 'package:flutter/material.dart';

class Misol extends StatelessWidget {
  Misol({super.key, });
  static String count = "Hasan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          count,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
