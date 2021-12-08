import 'package:flutter/material.dart';

class Roundedbutton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const Roundedbutton({
    Key?  key,
    required this.text,
    required this.press,
    this.color = Colors.grey,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        textStyle: TextStyle(
          color: textColor, fontSize: 25, fontWeight: FontWeight.w500)
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
    );
  }
}
