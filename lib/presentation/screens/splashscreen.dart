import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/presentation/screens/login/signin_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          centered: true,
          splashTransition: SplashTransition.scaleTransition,
          splashIconSize: 340,
          backgroundColor: splashcolor,
          splash: const Image(image: AssetImage("assets/images/logo.png")),
          nextScreen: SignInScreen(),
          // nextScreen: MainPage(),
        ),
      ),
    );
  }
}
