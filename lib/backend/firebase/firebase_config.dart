import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBCDzJOnxshLsDd7-GDVppjcYScfSUXhvs",
            authDomain: "animalcommunication-c6013.firebaseapp.com",
            projectId: "animalcommunication-c6013",
            storageBucket: "animalcommunication-c6013.firebasestorage.app",
            messagingSenderId: "61813909664",
            appId: "1:61813909664:web:3fec2f1f53d4306a15c1c5"));
  } else {
    await Firebase.initializeApp();
  }
}
