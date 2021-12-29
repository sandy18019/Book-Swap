import 'package:flutter/material.dart';
import 'package:book_swap/Widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade100,
      body: SignupScreenState(),
    );
  }
}

class SignupScreenState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 60),
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
          const SizedBox(height: 30),
          SignUpForm(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Text(
              "Already have an account Sign In",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
