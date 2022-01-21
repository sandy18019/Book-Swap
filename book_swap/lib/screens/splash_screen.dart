import 'package:book_swap/helpers/appcolors.dart';
import 'package:book_swap/screens/welcomescreen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashScreen({required this.goToPage, required this.duration});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>WelcomeScreen()));
    });
    return Scaffold(
      body: Container(
        color: AppColors.Main_color,
        alignment: Alignment.center,
        child: Image.asset('assets/images/bookswap.png'),
      ),
    );
  }
}
