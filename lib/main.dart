import 'package:classlink/db/functions/db_functions.dart';
import 'package:classlink/screens/scn_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  await Firebase.initializeApp();
  runApp(const ClassLinkCloud());
}

class ClassLinkCloud extends StatelessWidget {
  const ClassLinkCloud({super.key});
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
