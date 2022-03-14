import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homage_insta/data/location.dart';
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

  Location? _location;
  Location? get location => _location;

  String _locationString = "";
  String get locationString => _locationString;

  void imagePicked(PostUploadType uploadType) async{
    _isLoading = true;
    _isImagePicked = false;
    notifyListeners();

    // 画像取得
    _imageFile = await postRepository.imagePicked(uploadType);

    // 位置情報取得
    _location = await postRepository.getLocation();
    _locationString = _location != null ? _locationToString(_location!) : "";

    _isLoading = false;
    if(_imageFile != null) _isImagePicked = true;
    notifyListeners();
  }

  String _locationToString(Location location) {
    return location.country + " " + location.state + " " + location.city;
  }



  String _postCaption = "";
  String get postCaption => _postCaption;

  TextEditingController _postCaptionController = TextEditingController();
  TextEditingController get postCaptionController => _postCaptionController;

  void onCaptionUpdated(String value) {
    _postCaption = value;
  }

}