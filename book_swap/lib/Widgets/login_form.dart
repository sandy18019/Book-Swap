import 'package:book_swap/Widgets/rounded_input_field.dart';
import 'package:book_swap/Widgets/text_field_container.dart';
import 'package:book_swap/helpers/appcolors.dart';
import 'package:book_swap/screens/home_screen.dart';
import 'package:book_swap/services/authentication_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Color color, textColor;
  bool _showPassword = true;

  _LoginFormState(
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
        child: Column(children: [
          TextFormField(
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'PLEASE ENTER YOUR EMAIL';
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
                suffixIcon: Icon(Icons.mail),
                contentPadding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                return ('Enter password correctly');
              }
              return null;
            },
            onSaved: (value) {
              passwordController.text = value!;
            },
            obscureText: _showPassword,
            decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off),
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
          Consumer<AuthenticationSrvice>(
            builder: (context, value, child) => ElevatedButton(
              onPressed: () async {
                SignIn(emailController.text, passwordController.text);
                String e, p;
                e = emailController.text.trim();
                p = passwordController.text.trim();
                if (e != "" && p != "") {
                  await value.signIn(email: e, password: p).then(
                      (value) => Navigator.pushNamed(context, '/homescreen'));
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  primary: AppColors.Main_color,
                  padding: EdgeInsets.all(25),
                  textStyle: TextStyle(
                      color: textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w500)),
              child: Text("Login", style: TextStyle(color: textColor)),
            ),
          ),
        ]),
      ),
    );
  }

  void SignIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successfully"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
