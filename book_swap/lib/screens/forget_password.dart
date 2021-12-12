import 'package:flutter/material.dart';

class forgetpassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade100,
      body: myforgetpassword(),
    );
  }
}

class myforgetpassword extends StatelessWidget {
  const myforgetpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 100),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                
              ],),
          )
        ],
      ),
    );
  }
}
