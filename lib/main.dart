import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAih5RcLXNzHRwIfdOozOxETe_KC-5mCwE",
            authDomain: "tikuret-baby-sitting.firebaseapp.com",
            projectId: "tikuret-baby-sitting",
            storageBucket: "tikuret-baby-sitting.firebasestorage.app",
            messagingSenderId: "413258250220",
            appId: "1:413258250220:web:30b068774e6b3307aef2c9"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}
