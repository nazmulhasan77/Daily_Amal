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
    apiKey: 'AIzaSyCLSY_2atZua1HmJnQg7xEGJk3xzAHt8Co',
    appId: '1:308884940697:web:130de4b6dfa01ed0565508',
    messagingSenderId: '308884940697',
    projectId: 'testapp-bb402',
    authDomain: 'testapp-bb402.firebaseapp.com',
    storageBucket: 'testapp-bb402.firebasestorage.app',
    measurementId: 'G-ZKB12Z0JEX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpGsR9qLR8bEDmGfQGHBnXxbo7iisO7ZQ',
    appId: '1:308884940697:android:a98474a96dfd89a2565508',
    messagingSenderId: '308884940697',
    projectId: 'testapp-bb402',
    storageBucket: 'testapp-bb402.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRqOMIle1N2-quZ3fdHi5QInhepI-eunI',
    appId: '1:308884940697:ios:1429477fa4251252565508',
    messagingSenderId: '308884940697',
    projectId: 'testapp-bb402',
    storageBucket: 'testapp-bb402.firebasestorage.app',
    iosBundleId: 'com.example.dailyAmal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRqOMIle1N2-quZ3fdHi5QInhepI-eunI',
    appId: '1:308884940697:ios:1429477fa4251252565508',
    messagingSenderId: '308884940697',
    projectId: 'testapp-bb402',
    storageBucket: 'testapp-bb402.firebasestorage.app',
    iosBundleId: 'com.example.dailyAmal',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCLSY_2atZua1HmJnQg7xEGJk3xzAHt8Co',
    appId: '1:308884940697:web:264c8daf582a8062565508',
    messagingSenderId: '308884940697',
    projectId: 'testapp-bb402',
    authDomain: 'testapp-bb402.firebaseapp.com',
    storageBucket: 'testapp-bb402.firebasestorage.app',
    measurementId: 'G-4B93F392R2',
  );
}
