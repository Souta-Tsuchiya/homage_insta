

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homage_insta/model/repositories/user_repository.dart';
import 'package:homage_insta/util/const.dart';

import '../model/repositories/post_repository.dart';

class PostViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;

  PostViewModel({required this.userRepository, required this.postRepository});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isImagePicked = false;
  bool get isImagePicked => _isImagePicked;

  File? _imageFile;
  File? get imageFile => _imageFile;

  void imagePicked(PostUploadType uploadType) async{
    _isLoading = true;
    _isImagePicked = false;
    notifyListeners();

    // 画像取得
    _imageFile = await postRepository.imagePicked(uploadType);

    // 位置情報取得




    _isLoading = false;
    if(_imageFile != null) _isImagePicked = true;
    notifyListeners();
  }
}