import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repository/ProfileRepository.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({required ProfileUploadRepository authRepo}) : _authRepo = authRepo;
  final ProfileUploadRepository _authRepo;

  final bioController = TextEditingController();
  File? profilePhoto;
  String? _gender;
  String? get gender => _gender;

  set gender(String? value) {
    _gender = value;
    notifyListeners();
  }
  Future<void> pickProfilePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      profilePhoto = File(photo.path);
      notifyListeners();
    }
  }

  Future<bool> completeProfile() async {
    int? userId = await getUserId();
    if (userId == null) {
      print("❌ Xatolik: User ID topilmadi!");
      return false;
    }
    print("✅ User ID: $userId");

    if (profilePhoto != null) {
      return await _authRepo.uploadProfilePhoto(profilePhoto!, userId);
    }
    return true;
  }

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("12");
    print("🔍 Olingan User ID: $userId");
    return userId;
  }
}
