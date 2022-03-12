import 'package:flutter/material.dart';
import 'package:homage_insta/model/repositories/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  LoginViewModel({required this.userRepository});

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  Future<void> checkSignIn() async{
    _isLogin = await userRepository.checkSignIn();
    notifyListeners();
  }
}