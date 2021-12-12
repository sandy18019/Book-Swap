import 'package:flutter/material.dart';

class signupbutton extends StatefulWidget {
  final bool login;
  final Function press;
  const signupbutton({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  State<signupbutton> createState() => _signupbuttonState();
}

class _signupbuttonState extends State<signupbutton> {
//  get login => true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        Text(
          widget.login ? "New to BookSwap?" : "Already have an account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/signup');
          },
          child: Text(
            widget.login ? "Create your account now" : "Sign In",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
