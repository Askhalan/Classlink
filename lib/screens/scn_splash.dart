import 'package:classlink/screens/scn_home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const Home(),
      ));
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 65, 169, 255),
              Color.fromARGB(255, 176, 234, 255),
              Color.fromARGB(255, 226, 253, 255),
              Color.fromARGB(255, 173, 255, 244),
              Color.fromARGB(255, 31, 255, 147),
            ],
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/logo.png', height: 350),
        ),
      ),
    );
  }
}