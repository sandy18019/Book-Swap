import 'package:book_swap/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:book_swap/Widgets/signup_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      ),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
