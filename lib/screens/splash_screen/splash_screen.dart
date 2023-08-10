import 'dart:async';

import 'package:flutter/material.dart';

import '../../config/image_string.dart';
import '../home_screen/home_screen.dart';
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
      Navigator.pushNamed(context, HomeScreen.routeName);
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
        child: Column(
          children: [
            SizedBox(
              child: Image.asset(top_splash_screen),
            ),
            const Center(
              child: Text('Loading...'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignupScreen.routeName);
                },
                child: const Text('continue'))
          ],
        ),
      ),
    );
  }
}
