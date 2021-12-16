import 'package:flutter/material.dart';
import 'package:book_swap/constants/color_constant.dart';
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
              Padding(
                  padding: EdgeInsets.only(left: 25, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'hello UserName',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'RacingSansOne',
                            color: Colors.grey),
                      ),
                      Text(
                        'Main Library',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'RacingSansOne',
                            color: Colors.black),
                      ),
                    ],
                  )),
              Container(
                height: 39,
                margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepOrange.shade100),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'RacingSansOne',
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 19, bottom: 10),
                          border: InputBorder.none,
                          hintText: 'Search for books',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'RacingSansOne',
                          )),
                    ),
                    Positioned(
                      top: 3,
                      right: 9,
                      child: Icon(
                        Icons.search,
                        size: 37,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
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
              Container(
                margin: EdgeInsets.only(top: 21),
                height: 210,
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 25, right: 6),
                    itemCount: newbooks.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 19),
                        height: 180,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(newbooks[index].image),
                            )),
                      );
                    }),
              ),
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
              ListView.builder(
                  padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print('ListView Tapped');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SelectedBookScreen(BookModel: books[index]),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 19),
                        height: 81,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrange.shade100,
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(books[index].image),
                                  ),
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  books[index].title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: 'RacingSansOne'),
                                ),
                                Text(
                                  books[index].author,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      fontFamily: 'RacingSansOne'),
                                ),
                                Text(
                                  '\EGP' + books[index].price,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontFamily: 'RacingSansOne'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
