import 'package:flutter/material.dart';
import 'package:book_swap/models/books_model.dart';

class SelectedBookScreen extends StatelessWidget {
  final BooksModel BookModel;

  SelectedBookScreen({required this.BookModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 49,
        color: Colors.transparent,
        child: FlatButton(
          color: Colors.redAccent,
          onPressed: () {},
          child: Text(
            'Add To Cart',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.redAccent,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 25,
                        top: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/homeScreen");
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 62),
                          width: 175,
                          height: 220,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(BookModel.image),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 25),
                  child: Text(
                    BookModel.title,
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'RacingSansOne'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7, left: 25),
                  child: Text(
                    BookModel.author,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'RacingSansOne'),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 7, left: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '\EGP',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'RacingSansOne'),
                        ),
                        Text(
                          BookModel.price,
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'RacingSansOne'),
                        ),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(left: 25),
                  margin: EdgeInsets.only(top: 23, bottom: 36),
                  child: Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: 'RacingSansOne'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, bottom: 50),
                  child: Text(
                    BookModel.description,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontFamily: 'RacingSansOne',
                      //letterSpacing: 1,
                      //height: 1,
                    ),
                  ),
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
