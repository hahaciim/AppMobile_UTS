import 'package:flutter/material.dart';

class FlutterSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/image/splash.png'), // Optional secondary splash image
      ),
    );
  }
}
