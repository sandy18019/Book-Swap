import 'package:book_swap/Widgets/all_books.dart';
import 'package:book_swap/Widgets/home_heading.dart';
import 'package:book_swap/Widgets/home_new_books.dart';
import 'package:book_swap/Widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:book_swap/models/new_model.dart';
import 'package:book_swap/models/books_model.dart';
import 'package:book_swap/screens/selected_book_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              heading(),
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

            ],
          ),
        ),
      ),
    );
  }
}
