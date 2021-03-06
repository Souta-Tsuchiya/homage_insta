import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:homage_insta/di/providers.dart';
import 'package:homage_insta/firebase_options.dart';
import 'package:homage_insta/generated/l10n.dart';
import 'package:homage_insta/view/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:homage_insta/view/login/login_screen.dart';
import 'package:homage_insta/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: globalProviders,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();
    Future(() {
      loginViewModel.checkSignIn();
    });

    return MaterialApp(
      title: "オマージュインスタ",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryIconTheme: IconThemeData(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: ElevatedButton.styleFrom(primary: Colors.white30)),
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: Selector<LoginViewModel, bool>(
        selector: (context, loginViewModel) => loginViewModel.isSignIn,
        builder: (context, isSignIn, child) {
          if (isSignIn) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
