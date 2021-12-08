import 'package:flutter/material.dart';


// ignore: camel_case_types
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
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        Text(
          widget.login ?"Don't have an account yet?" : "Already have an account",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: (){},
          child: Text(
            widget.login? "Sign Up":"Sign In",
            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
