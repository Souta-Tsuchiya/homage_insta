import 'package:homage_insta/model/managers/database_manager.dart';
import 'package:homage_insta/model/managers/location_manager.dart';
import 'package:homage_insta/model/repositories/post_repository.dart';
import 'package:homage_insta/model/repositories/user_repository.dart';
import 'package:homage_insta/view_model/login_view_model.dart';
import 'package:homage_insta/view_model/post_view_model.dart';
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
  Provider(
    create: (context) => LocationManager(),
  ),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<DatabaseManager, UserRepository>(
    update: (context, databaseManager, userRepository) =>
        UserRepository(dbManager: databaseManager),
  ),
  ProxyProvider2<DatabaseManager, LocationManager, PostRepository>(
    update: (context, databaseManager, locationManager, postRepository) =>
        PostRepository(dbManager: databaseManager, locationManager: locationManager),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<LoginViewModel>(
    create: (context) => LoginViewModel(
      userRepository: context.read<UserRepository>(),
    ),
  ),
  ChangeNotifierProvider<PostViewModel>(
    create: (context) => PostViewModel(
      userRepository: context.read<UserRepository>(),
      postRepository: context.read<PostRepository>(),
    ),
  ),
];
