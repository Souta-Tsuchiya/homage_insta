import 'package:flutter/material.dart';
import 'package:homage_insta/model/repositories/user_repository.dart';

import '../model/repositories/post_repository.dart';

class PostViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;

  PostViewModel({required this.userRepository, required this.postRepository});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isImagePicked = false;
  bool get isImagePicked => _isImagePicked;
}