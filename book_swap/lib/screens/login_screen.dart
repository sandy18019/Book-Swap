import 'package:book_swap/Widgets/login_form.dart';
import 'package:book_swap/Widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade100,
      body: const MyLoginScreen(),
    );
  }
}

class MyLoginScreen extends StatelessWidget {
  const MyLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 100),
          Align(
            alignment: Alignment.topCenter,
            child: Stack(children: [
              Text('WELCOME TO BOOKSWAPS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 45,
                    fontFamily: 'RacingSansOne',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 10
                      ..color = Colors.deepOrange.shade200,
                  )),
              const Text('WELCOME TO BOOKSWAPS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 45,
                    fontFamily: 'RacingSansOne',
                    color: Colors.white,
                  )),
            ]),
          ),
          const SizedBox(height: 70),
          LoginForm(),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "New to BookSwap?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    " Create your account now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
