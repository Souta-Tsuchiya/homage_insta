// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZSYFSexM_0z---zNTBZE3_reNQHrrzbs',
    appId: '1:608368563600:android:3c80762c4c82ec1b710f15',
    messagingSenderId: '608368563600',
    projectId: 'homageinsta-be80a',
    storageBucket: 'homageinsta-be80a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqIQwAj8NbTRRQJH_qq-x46gs7mOnZj5s',
    appId: '1:608368563600:ios:fd56d07b09a463bb710f15',
    messagingSenderId: '608368563600',
    projectId: 'homageinsta-be80a',
    storageBucket: 'homageinsta-be80a.appspot.com',
    androidClientId: '608368563600-c38qivb8e9qq7c74puuf98g336t9i85o.apps.googleusercontent.com',
    iosClientId: '608368563600-bthojqr7qmtmnlpbf0alp9rj65qhb4r2.apps.googleusercontent.com',
    iosBundleId: 'com.hayabusa.example.homageInsta',
  );
}
