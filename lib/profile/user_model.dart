import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_for_beginners/profile/user.dart';
import 'package:image_picker/image_picker.dart';

class UserModel extends ChangeNotifier {
  ImagePicker imagePicker = ImagePicker();

  // File? selectedImage;

  User? _user;

  User? get user => _user;

  Future<void> imageSelector(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);

    if (image != null) {
      if (_user != null) {
        _user?.image = File(image!.path);
      } else {
        _user = User(
            name: " Nour ",
            bio: "Code .Sleep. Eat. Repeat",
            image: File(image!.path));
      }

      notifyListeners();
    }
  }

  void removeImage() {
    _user?.image = null;

    notifyListeners();
  }
}
