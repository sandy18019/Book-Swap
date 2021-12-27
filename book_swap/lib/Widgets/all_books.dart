import 'package:book_swap/models/books_model.dart';
import 'package:book_swap/screens/selected_book_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menu extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 25, right: 25, left: 25),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
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
        });
  }
}
