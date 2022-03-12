import 'package:flutter/material.dart';
import 'package:homage_insta/model/repositories/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  LoginViewModel({required this.userRepository});

  bool _isSignIn = false;
  bool get isSignIn => _isSignIn;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  Future<void> checkSignIn() async{
    _isSignIn = await userRepository.checkSignIn();
    notifyListeners();
  }

  Future<void> signIn() async{
    _isLoading = true;
    notifyListeners();

    _isSuccess = await userRepository.signIn();
    _isLoading = false;
    notifyListeners();
  }
}