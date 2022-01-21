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
        height: 50,
        color: Colors.transparent,
        child: RawMaterialButton(
          fillColor: Colors.deepOrange.shade200,
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
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
              SliverAppBar (
                backgroundColor: Colors.deepOrange.shade100,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 60),
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
                              fontFamily: 'RacingSansOne'),
                        ),
                        Text(
                          BookModel.price,
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.redAccent,
                              fontFamily: 'RacingSansOne'),
                        ),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(left: 25),
                  margin: EdgeInsets.only(top: 10, bottom: 15),
                  child: Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'RacingSansOne'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    BookModel.description,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'RacingSansOne',
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
