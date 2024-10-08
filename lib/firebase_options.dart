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
    apiKey: 'AIzaSyCw64hvtzjXHTqeTjr2VSuR8qHVKNifeFg',
    appId: '1:186244231736:web:69623c66e3ff330dd8eccd',
    messagingSenderId: '186244231736',
    projectId: 'marketplace-flutter1',
    authDomain: 'marketplace-flutter1.firebaseapp.com',
    storageBucket: 'marketplace-flutter1.appspot.com',
    measurementId: 'G-4728ZG7QLQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0r7O7rFENi6B0oB1WP2ME8XqfdOfdwOw',
    appId: '1:186244231736:android:a1a5e4c5405fbe56d8eccd',
    messagingSenderId: '186244231736',
    projectId: 'marketplace-flutter1',
    storageBucket: 'marketplace-flutter1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARGKKD-KeasD67ibm_HICjikqn8lOOR10',
    appId: '1:186244231736:ios:0f614af7319c42fdd8eccd',
    messagingSenderId: '186244231736',
    projectId: 'marketplace-flutter1',
    storageBucket: 'marketplace-flutter1.appspot.com',
    iosBundleId: 'com.example.marketplaceKelompok4',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARGKKD-KeasD67ibm_HICjikqn8lOOR10',
    appId: '1:186244231736:ios:0f614af7319c42fdd8eccd',
    messagingSenderId: '186244231736',
    projectId: 'marketplace-flutter1',
    storageBucket: 'marketplace-flutter1.appspot.com',
    iosBundleId: 'com.example.marketplaceKelompok4',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCw64hvtzjXHTqeTjr2VSuR8qHVKNifeFg',
    appId: '1:186244231736:web:ad16c6d70c223f09d8eccd',
    messagingSenderId: '186244231736',
    projectId: 'marketplace-flutter1',
    authDomain: 'marketplace-flutter1.firebaseapp.com',
    storageBucket: 'marketplace-flutter1.appspot.com',
    measurementId: 'G-GF3YCCPTRV',
  );
}
