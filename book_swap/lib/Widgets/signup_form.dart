import 'package:book_swap/helpers/appcolors.dart';
import 'package:book_swap/screens/home_screen.dart';
import 'package:book_swap/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _showPassword = true;

  final Color color = Colors.grey;
  final Color textColor = Colors.white;

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
          key: _formKey,
          child: Column(
            children: [
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
                onSaved: (value) => firstNameController.text = value!,
                textInputAction: TextInputAction.next,
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
                onSaved: (value) => lastNameController.text = value!,
                textInputAction: TextInputAction.next,
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
                onSaved: (value) => emailController.text = value!,
                textInputAction: TextInputAction.next,
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
                onSaved: (value) => passwordController.text = value!,
                obscureText: _showPassword,
                textInputAction: TextInputAction.next,
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
                controller: confirmPasswordController,
                validator: (value) {
                  if (passwordController.text.length > 8 &&
                      passwordController.text != value) {
                    return ('Password do not match');
                  }
                  return null;
                },
                onSaved: (value) => confirmPasswordController.text = value!,
                obscureText: _showPassword,
                textInputAction: TextInputAction.done,
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final user = await authProvider.registrationWithEmail(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
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
                  primary: AppColors.Main_color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(12),
                  textStyle: TextStyle(
                    color: textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                child: Text("SignUp", style: TextStyle(color: textColor)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
