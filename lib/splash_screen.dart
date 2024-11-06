import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Start a timer that will navigate to the home screen after 1.5 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const MyHomeScreen(),
      ));
    });

    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 19, 19, 19), // Same as your theme
      body: Center(
        child: SizedBox(
          width: 400,
          height: 300,
          child: Center(
              child: Lottie.asset('assets/gemini_splash.json', animate: true)),
        ),
      ),
    );
  }
}
