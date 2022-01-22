import 'package:book_swap/Widgets/all_books.dart';
import 'package:book_swap/Widgets/drawer_widget.dart';
import 'package:book_swap/Widgets/home_new_books.dart';
import 'package:book_swap/Widgets/search_bar.dart';
import 'package:book_swap/helpers/appcolors.dart';
import 'package:book_swap/models/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.deepOrange),
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
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
            NewBooks(),
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: Text(
                'All Books',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'RacingSansOne'),
              ),
            ),
            AllBooks(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/addbook'),
        backgroundColor: AppColors.Main_color,
        label: Text(
          'Add book',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    );
  }
}
