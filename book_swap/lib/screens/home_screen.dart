import 'package:flutter/material.dart';
import 'package:flutterbookapp/constants/color_constant.dart';
import 'package:flutterbookapp/models/new_model.dart';
import 'package:flutterbookapp/models/books_model.dart';
import 'package:flutterbookapp/screens/selected_book_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Text(
                        'Main Library',
                        style: GoogleFonts.openSans(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  )),
              Container(
                height: 39,
                margin: EdgeInsets.only(left: 25, right: 25, top: 18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: customLightGreyColor),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 19, right: 50, bottom: 8),
                          border: InputBorder.none,
                          hintText: 'Search for books',
                          hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600)),
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
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
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
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
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
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
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
                                  style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  books[index].author,
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                Text(
                                  '\EGP' + books[index].price,
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
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
