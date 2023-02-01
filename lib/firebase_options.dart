// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDfMXlo2_HaZEMW2J7gy2pffTWAXsRqIYU',
    appId: '1:540696413366:web:d67bfbf82bfaf0a8181217',
    messagingSenderId: '540696413366',
    projectId: 'my-assign-signup',
    authDomain: 'my-assign-signup.firebaseapp.com',
    storageBucket: 'my-assign-signup.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhF1cIwCzQzctWXeLN288ksPDxa_810UM',
    appId: '1:540696413366:android:7d0e1edc84e3cac8181217',
    messagingSenderId: '540696413366',
    projectId: 'my-assign-signup',
    storageBucket: 'my-assign-signup.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDM10hFgqOdycwl0zxqcapW7zf8LGVY1yM',
    appId: '1:540696413366:ios:841e0b9bed3ca518181217',
    messagingSenderId: '540696413366',
    projectId: 'my-assign-signup',
    storageBucket: 'my-assign-signup.appspot.com',
    iosClientId: '540696413366-5t641frtbh219u4usl0j4b6iijj7572d.apps.googleusercontent.com',
    iosBundleId: 'com.example.assign1',
  );
}
