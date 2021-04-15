import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier {
  List<File> imagesList = [];
  File image;

  void add({File image}) {
    imagesList.add(image);
    notifyListeners();
  }

  Future getImage(ImageSource src) async {
    final pickedFile = await ImagePicker().getImage(source: src);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagesList.add(image);
      notifyListeners();
      print('Image selected.');
    } else {
      print('No image selected.');
    }
  }

  void deleteImage() {
    image = null;
  }
}
