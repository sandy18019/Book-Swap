import 'package:book_swap/helpers/appcolors.dart';
import 'package:book_swap/screens/home_screen.dart';
import 'package:book_swap/services/authentication_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Color color = Colors.grey;
  final Color textColor = Colors.white;
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<AuthenticationSrvice>(builder: (context, authProvider, _) {
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
              onSaved: (value) => emailController.text = value!,
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
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
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
            authProvider.isLoadingSignIn
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                        final user = await authProvider.signInWithEmail(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        if (user != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        primary: AppColors.Main_color,
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        textStyle: TextStyle(
                          color: textColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        )),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
          ]),
        ),
      );
    });
  }
}