import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsN8mBKorivTJbEpnlw7Rl7yR-Z21eba4',
    appId: '1:445783221135:android:00fcc32f4df96c5ffd61fa',
    messagingSenderId: '445783221135',
    projectId: 'to-do-list-d61e2',
    storageBucket: 'to-do-list-d61e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKWLk46v1iK_2itQ3x6dYRHcLDz2wb6uU',
    appId: '1:445783221135:ios:d93c39e4e25fddb3fd61fa',
    messagingSenderId: '445783221135',
    projectId: 'to-do-list-d61e2',
    storageBucket: 'to-do-list-d61e2.appspot.com',
    iosClientId: '445783221135-0o9dr2l4746jp7e2ptk2jhvpsnlu1pg3.apps.googleusercontent.com',
    iosBundleId: 'todo.list.com.example.todoListApp',
  );
}
