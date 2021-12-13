import 'package:flutter/material.dart';
import 'package:book_swap/Widgets/text_field_container.dart';

class SignUpForm extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Color color, textColor;
  SignUpForm(
      {this.color = Colors.grey, this.textColor = Colors.white, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            //SizedBox(height: 20),
            TextFormField(
              controller: firstNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'PLEASE ENTER YOUR FIRST NAME';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Your first name ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  fillColor: Colors.white,
                  filled: true),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: lastNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'PLEASE ENTER YOUR LAST NAME';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Your last name ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  fillColor: Colors.white,
                  filled: true),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'PLEASE ENTER YOUR EMAIL NAME';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Your Email ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  fillColor: Colors.white,
                  filled: true),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'PLEASE ENTER A PASSWORD';
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter your Password",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  fillColor: Colors.white,
                  filled: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(' ')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: color,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  textStyle: TextStyle(
                      color: textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w500)),
              child: Text("SignUp", style: TextStyle(color: textColor)),
            ),
          ],
        ),
      ),
    );
  }
}
