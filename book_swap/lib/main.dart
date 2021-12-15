// ignore_for_file: prefer_const_constructors, duplicate_ignore
import 'package:book_swap/screens/addbook_screen.dart';
import 'package:book_swap/screens/cart_screen.dart';
import 'package:book_swap/screens/home_screen.dart';
import 'package:book_swap/screens/login_screen.dart';
import 'package:book_swap/screens/settings_screen.dart';
import 'package:book_swap/screens/signup_screen.dart';
import 'package:book_swap/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
     // home: SplachScreen(),
      routes: {
        '/': (context) => SplachScreen(),
        '/Loginscreen': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/cart': (context) => CartView(),
        '/setting': (context) => SettingsPage(),
        '/addbook': (context) => AddBook(),
        '/homescreen': (context) => HomeScreen(),
      },
    );
  }
}
