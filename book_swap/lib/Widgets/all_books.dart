import 'package:book_swap/models/book_model.dart';
import 'package:book_swap/screens/selected_book_screen.dart';
import 'package:book_swap/utils/ref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllBooks extends StatelessWidget {
  const AllBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<BookModel>>(
      stream: booksFirestoreRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text(snapshot.error.toString());

        if (snapshot.hasData) {
          final books = snapshot.data?.docs ?? [];
          return ListView.builder(
              padding: EdgeInsets.only(top: 25, right: 25, left: 25),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index].data();
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectedBookScreen(bookId: book.bookId),
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
                                image: NetworkImage(book.image),
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
                              book.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontFamily: 'RacingSansOne'),
                            ),
                            Text(
                              book.author,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: 'RacingSansOne'),
                            ),
                            Text(
                              '\EGP' + book.price,
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
