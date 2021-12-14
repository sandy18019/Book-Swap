import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class MySplashScreen extends StatefulWidget {
  @override
  State<SplashScreenView> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<SplashScreenView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon)
          ],
        ),
      ),
    );
  }
}
