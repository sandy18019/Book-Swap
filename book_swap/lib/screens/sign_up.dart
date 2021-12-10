import 'package:book_swap/Widgets/button.dart';
import 'package:book_swap/Widgets/password.dart';
import 'package:book_swap/Widgets/rounded_input_field.dart';
import 'package:flutter/material.dart';

class signupScreen extends StatelessWidget {
  const signupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade100,
      body: MySignupScreen(),
    );
  }
}

class MySignupScreen extends StatelessWidget {
  const MySignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 100),
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
                      ..color = Colors.deepOrange.shade200,
                  )),
              Text('WELCOME TO BOOKSWAPS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 45,
                    fontFamily: 'RacingSansOne',
                    color: Colors.white,
                  )),
            ]),
          ),
          SizedBox(height: 30),
          RoundedInputField(
            hintText: "Your first name ",
            onChanged: (value) {},
          ),
          RoundedInputField(
            hintText: "Your last name ",
            onChanged: (value) {},
          ),
          RoundedInputField(
            hintText: "Your Email ",
            onChanged: (value) {},
          ),
          password(
            onChanged: (value) {},
          ),
          Roundedbutton(text: "Sign up", press: () {}),
        ],
      ),
    );
  }
}
