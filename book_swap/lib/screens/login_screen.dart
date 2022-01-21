import 'package:book_swap/Widgets/login_form.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
              opacity: 0.3,
              child: Image.asset('assets/images/background.jpg',
                  fit: BoxFit.cover),
            )),
            Center(
              child: SingleChildScrollView(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
