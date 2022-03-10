import 'package:flutter/material.dart';
import 'package:homage_insta/model/managers/database_manager.dart';

class UserRepository extends ChangeNotifier {
  final DatabaseManager dbManager;

  UserRepository({required this.dbManager});
}