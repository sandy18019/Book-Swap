import 'package:book_swap/Widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class password extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const password({
    Key? key, 
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Enter your Password",
        suffixIcon: Icon(
          Icons.visibility,
          color: Colors.black,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
