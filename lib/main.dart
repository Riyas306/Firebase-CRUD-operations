import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studentfirebase/homepage.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyDEzrPcyNVpSUVrcE1Pdfsa-md54bapBZE",
     appId: "1:780926526892:android:89915d54701a0a416d8609",
      messagingSenderId: "messagingSenderId",
       projectId: "fir-2a08f")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

