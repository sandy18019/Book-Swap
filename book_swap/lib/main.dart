// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:book_swap/screens/cart_screen.dart';
import 'package:book_swap/screens/login_screen.dart';
import 'package:book_swap/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/cart':(context)=> CartView(),
        //'/forgetpassword':(context) => forgetpassword(),
      },
    );
  }
}
