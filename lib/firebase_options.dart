import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return android;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return ios;
    } else {
      return web;
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyA08EpxCpf8jSw6ym12gQ2qQ4YaGrtHrgI",
    appId: "1:641154885131:android:65e3aaa9dc8b1e41c1890e",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    projectId: "fir-app-8d674",
    storageBucket: "fir-app-8d674.firebasestorage.app",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "YOUR_IOS_API_KEY",
    appId: "YOUR_IOS_APP_ID",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    projectId: "YOUR_PROJECT_ID",
    storageBucket: "YOUR_STORAGE_BUCKET",
    iosClientId: "YOUR_IOS_CLIENT_ID",
    iosBundleId: "YOUR_IOS_BUNDLE_ID",
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyBsvqLZ6sozF-PAee6Jxei4SJZNpKv1fA4",
    appId: "1:641154885131:web:3d3446b43cb8864ec1890e",
    messagingSenderId: "641154885131",
    projectId: "fir-app-8d674",
    storageBucket: "fir-app-8d674.firebasestorage.app",
    authDomain: "fir-app-8d674.firebaseapp.com",
    measurementId: "YOUR_MEASUREMENT_ID",
  );
}