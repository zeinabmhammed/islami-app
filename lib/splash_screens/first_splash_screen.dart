import 'package:flutter/material.dart';
import 'package:islami/splash_screens/second_splash_screen.dart';
import 'package:islami/ui/design.dart';

class FirstSplashScreen extends StatefulWidget {
  const FirstSplashScreen({super.key});

  @override
  State<FirstSplashScreen> createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SecondSplashScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.splashBackground, fit: BoxFit.cover),
          ),
          Positioned(
            top: 57,
            left: 69,
            child: Image.asset(
              AppImages.splashTop,
              width: 291,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 90,
            left: 329,
            child: Image.asset(
              AppImages.splashGlow,
              width: 88,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            top: 214,
            child: Image.asset(
              AppImages.splashUp,
              width: 87,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            right: 0,
            top: 604,
            child: Image.asset(
              AppImages.splashDown,
              width: 101,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Image.asset(
              AppImages.splashIslami,
              width: 174,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
