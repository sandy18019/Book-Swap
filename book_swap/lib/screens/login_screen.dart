import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade50,
      body: MyLoginScreen(),
    );
  }
}

class MyLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  foreground: new Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 10
                    ..color = Colors.deepOrange.shade100,
                )),
            Text('WELCOME TO BOOKSWAPS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'RacingSansOne',
                  color: Colors.white,
                ))
          ]),
        ),
      ],
    );
  }
}
