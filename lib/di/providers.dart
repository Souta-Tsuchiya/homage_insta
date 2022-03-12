import 'package:firebase_auth/firebase_auth.dart';
import 'package:homage_insta/model/managers/database_manager.dart';
import 'package:homage_insta/model/repositories/user_repository.dart';
import 'package:homage_insta/view_model/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider(
    create: (context) => DatabaseManager(),
  ),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<DatabaseManager, UserRepository>(
    update: (context, databaseManager, userRepository) =>
        UserRepository(dbManager: databaseManager),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(userRepository: context.read<UserRepository>(),),),
];
