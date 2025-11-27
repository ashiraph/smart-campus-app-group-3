
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCwF40J3wxQYTByvIU2HKeRUiI23MOD6qs',
    appId: '1:622828578230:web:9af4e354bba24284c04d17',
    messagingSenderId: '622828578230',
    projectId: 'must-smart-campus',
    authDomain: 'must-smart-campus.firebaseapp.com',
    storageBucket: 'must-smart-campus.firebasestorage.app',
    measurementId: 'G-VEKH108FW0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqXIdbuk-3LSjP2uJRmRTUdp_szinLbSQ',
    appId: '1:622828578230:android:72b646c443e88112c04d17',
    messagingSenderId: '622828578230',
    projectId: 'must-smart-campus',
    storageBucket: 'must-smart-campus.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6CjX1YREwLFkNu7rjE9_HeS2L0g_oae8',
    appId: '1:622828578230:ios:58e57ae85aec0e54c04d17',
    messagingSenderId: '622828578230',
    projectId: 'must-smart-campus',
    storageBucket: 'must-smart-campus.firebasestorage.app',
    iosBundleId: 'com.example.mustSmartCampus',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6CjX1YREwLFkNu7rjE9_HeS2L0g_oae8',
    appId: '1:622828578230:ios:58e57ae85aec0e54c04d17',
    messagingSenderId: '622828578230',
    projectId: 'must-smart-campus',
    storageBucket: 'must-smart-campus.firebasestorage.app',
    iosBundleId: 'com.example.mustSmartCampus',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCwF40J3wxQYTByvIU2HKeRUiI23MOD6qs',
    appId: '1:622828578230:web:6218a4bd08ea5ce0c04d17',
    messagingSenderId: '622828578230',
    projectId: 'must-smart-campus',
    authDomain: 'must-smart-campus.firebaseapp.com',
    storageBucket: 'must-smart-campus.firebasestorage.app',
    measurementId: 'G-GRKM8PDG0G',
  );
}