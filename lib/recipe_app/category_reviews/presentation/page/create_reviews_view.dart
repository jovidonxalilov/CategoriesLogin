import 'dart:io';

import 'package:categorylogin/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class CreateReviewsView extends StatelessWidget {
  const CreateReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RatingScreen(),
    );
  }
}

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _selectedRating = 0;
  File? _selectedImage;

  void _setRating(int rating) {
    setState(() {
      _selectedRating = rating;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 50,
        leading: Center(
          child: SvgPicture.asset("assets/back.svg"),
        ),
        title: Text(
          "Reviews",
          style: TextStyle(
            color: Colors.pink,
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => _setRating(index + 1),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            index < _selectedRating
                                ? 'assets/yulduz.svg'
                                : 'assets/starr.svg',
                            color: Colors.pink,
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    );
                  }),
                ),
                SizedBox(height: 10),
                Text(
                  "Your overall rating",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 40),
                TextFormField(
                  maxLines: 5,
                  minLines: 5,
                  style: TextStyle(height: 1),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 25, top: 20),
                    hintText: "About Yourself",
                    hintStyle: TextStyle(color: AppColors.bacround.withValues(alpha: 0.5)),
                    filled: true,
                    fillColor: Colors.pink.shade100,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: AppColors.redpink,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: AppColors.redpinkmain,
                        weight: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _selectedImage != null
                    ? Image.file(
                        _selectedImage!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
