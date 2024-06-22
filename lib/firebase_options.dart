// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD6ebLgflMyZXvZnJrER65GHpojDopN9TI',
    appId: '1:613177945026:web:f06499dd62445646ffc45b',
    messagingSenderId: '613177945026',
    projectId: 'measure-app-524b5',
    authDomain: 'measure-app-524b5.firebaseapp.com',
    storageBucket: 'measure-app-524b5.appspot.com',
    measurementId: 'G-6C6232V7BF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGSttsoDadrojo3lfpBQ64JTzymNRSYP8',
    appId: '1:613177945026:android:4c1129cab5c99249ffc45b',
    messagingSenderId: '613177945026',
    projectId: 'measure-app-524b5',
    storageBucket: 'measure-app-524b5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_91uTteTG5p6zhV7-FG7mCWB4TkYmHps',
    appId: '1:613177945026:ios:ddbd0a63c561fa27ffc45b',
    messagingSenderId: '613177945026',
    projectId: 'measure-app-524b5',
    storageBucket: 'measure-app-524b5.appspot.com',
    iosBundleId: 'com.example.measureApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_91uTteTG5p6zhV7-FG7mCWB4TkYmHps',
    appId: '1:613177945026:ios:ddbd0a63c561fa27ffc45b',
    messagingSenderId: '613177945026',
    projectId: 'measure-app-524b5',
    storageBucket: 'measure-app-524b5.appspot.com',
    iosBundleId: 'com.example.measureApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6ebLgflMyZXvZnJrER65GHpojDopN9TI',
    appId: '1:613177945026:web:8bbd8419e6eb9d8dffc45b',
    messagingSenderId: '613177945026',
    projectId: 'measure-app-524b5',
    authDomain: 'measure-app-524b5.firebaseapp.com',
    storageBucket: 'measure-app-524b5.appspot.com',
    measurementId: 'G-HF5HTE8G30',
  );
}
