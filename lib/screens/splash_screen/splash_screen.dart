import 'dart:async';

import 'package:flutter/material.dart';

import '../../config/image_string.dart';
import '../signup_screen/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, SignupScreen.routeName);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 10,
              child: Image.asset(top_splash_screen),
            ),
            const Center(
              child: Text('Loading...'),
            ),
          ],
        ),
      ),
    );
  }
}
