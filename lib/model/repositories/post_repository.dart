import 'dart:io';

import 'package:homage_insta/model/managers/database_manager.dart';
import 'package:homage_insta/util/const.dart';
import 'package:image_picker/image_picker.dart';

class PostRepository {
  final DatabaseManager dbManager;

  PostRepository({required this.dbManager});

  Future<File?> imagePicked(PostUploadType uploadType) async{
    final imagePicker = ImagePicker();

    if(uploadType == PostUploadType.CAMERA) {
      final pickImage = await imagePicker.pickImage(source: ImageSource.camera);
      return (pickImage != null) ? File(pickImage.path) : null;
    }else{
      final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);
      return (pickImage != null) ? File(pickImage.path) : null;
    }
  }
}