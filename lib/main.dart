import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studentfirebase/homepage.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "xxx",
     appId: "xxxx",
      messagingSenderId: "xxx",
       projectId: "xxxx")
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

