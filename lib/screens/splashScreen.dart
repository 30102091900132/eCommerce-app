import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ecommerce/screens/onbourdingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnbourdingScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(151, 117, 250, 1),
      body: Center(
        child: Image.asset(
          "assets/images/Logo.png",
        ),
      ),
    );
  }
}