import 'package:book_swap/Widgets/already_have_account.dart';
import 'package:book_swap/Widgets/button.dart';
import 'package:book_swap/Widgets/password.dart';
import 'package:book_swap/Widgets/rounded_input_field.dart';
import 'package:book_swap/Widgets/text_field_container.dart';
import 'package:book_swap/screens/sign_up.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade100,
      body: MyLoginScreen(),
    );
  }
}

class MyLoginScreen extends StatelessWidget {
  const MyLoginScreen({Key? key}) : super(key: key);

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
          SizedBox(height: 70),
          RoundedInputField(
            hintText: "Your Email ",
            onChanged: (value) {},
          ),
          password(
            onChanged: (value) {},
          ),
          Roundedbutton(text: "Sign In", press: () {}),
          signupbutton(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MySignupScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
