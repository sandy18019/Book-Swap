import 'package:book_swap/Widgets/all_books.dart';
import 'package:book_swap/Widgets/home_heading.dart';
import 'package:book_swap/Widgets/home_new_books.dart';
import 'package:book_swap/Widgets/search_bar.dart';
import 'package:book_swap/models/loginuser.dart';
import 'package:book_swap/models/signup.dart';
import 'package:book_swap/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  usermodel LoggedInUser = usermodel();

  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.LoggedInUser = usermodel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child:Text(
                  'hello ${LoggedInUser.firstName}${LoggedInUser.firstName}',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RacingSansOne',
                      color: Colors.grey),
                ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child:Text(
                  'Main Library',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'RacingSansOne',
                      color: Colors.black),
                ),
            ),
            searchBar(),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: Text(
                'New',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'RacingSansOne',
                ),
              ),
            ),
            newBooks(),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: Text(
                'All Books',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'RacingSansOne'),
              ),
            ),
            menu(),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
              height: 50,
              color: Colors.transparent,
              child: RawMaterialButton(
                fillColor: Colors.deepOrange.shade200,
                onPressed: () {
                  Navigator.pushNamed(context, '/addbook');
                },
                child: Text(
                  'Add book',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                ),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
