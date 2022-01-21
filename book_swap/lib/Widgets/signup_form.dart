import 'package:book_swap/helpers/appcolors.dart';
import 'package:book_swap/models/signup.dart';
import 'package:book_swap/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  bool _showPassword = true;
  final Color color, textColor;
  _SignUpFormState(
      {this.color = Colors.grey, this.textColor = Colors.white, Key? key});

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
                RegExp regExp = new RegExp(r'^.{3,}$');
                if (value!.isEmpty) {
                  return ('PLEASE ENTER YOUR FIRST NAME');
                }
                if (!regExp.hasMatch(value)) {
                  return ('Enter A valid Name (Min.3 Characters)');
                }
                return null;
              },
              onSaved: (value) {
                firstNameController.text = value!;
              },
              decoration: InputDecoration(
                  hintText: "Your first name ",
                  prefixIcon: Icon(Icons.account_circle),
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
                if (value!.isEmpty) {
                  return ('PLEASE ENTER YOUR LAST NAME');
                }
                return null;
              },
              onSaved: (value) {
                lastNameController.text = value!;
              },
              decoration: InputDecoration(
                  hintText: "Your last name ",
                  prefixIcon: Icon(Icons.account_circle),
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
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ('PLEASE ENTER A VALID EMAIL');
                }
                return null;
              },
              onSaved: (value) {
                emailController.text = value!;
              },
              decoration: InputDecoration(
                  hintText: "Email ",
                  prefixIcon: Icon(Icons.mail),
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
                RegExp regExp = new RegExp(r'^.{8,}$');
                if (value!.isEmpty) {
                  return ('PLEASE ENTER A Password');
                }
                if (!regExp.hasMatch(value)) {
                  return ('Enter A valid password (Min.8 Characters)');
                }
                return null;
              },
              onSaved: (value) {
                passwordController.text = value!;
              },
              obscureText: _showPassword,
              decoration: InputDecoration(
                  hintText: "Enter your Password",
                  suffixIcon: IconButton(
                    icon: Icon(_showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      _showPassword = !_showPassword;
                      setState(() {});
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  fillColor: Colors.white,
                  filled: true),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: confirmpasswordController,
              validator: (value) {
                if (passwordController.text.length > 8 &&
                    passwordController.text != value) {
                  return ('Password do not match');
                }
                return null;
              },
              onSaved: (value) {
                confirmpasswordController.text = value!;
              },
              obscureText: _showPassword,
              decoration: InputDecoration(
                  hintText: "Re-enter your Password",
                  suffixIcon: IconButton(
                    icon: Icon(_showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      _showPassword = !_showPassword;
                      setState(() {});
                    },
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
                SignUp(emailController.text, passwordController.text);
              },
              style: ElevatedButton.styleFrom(
                  primary: AppColors.Main_color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.all(25),
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

  void SignUp(String email, String Password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: Password)
          .then((value) => {postDetailsToFireStore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    usermodel userModel = usermodel();

    userModel.email = user!.email;
    userModel.userid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.LastName = lastNameController.text;

    await firebaseFirestore
        .collection("user")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully.");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
