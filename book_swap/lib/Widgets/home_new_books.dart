import 'package:book_swap/models/book_model.dart';
import 'package:book_swap/utils/ref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewBooks extends StatelessWidget {
  const NewBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<BookModel>>(
      stream: booksFirestoreRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text(snapshot.error.toString());

        if (snapshot.hasData) {
          final books = snapshot.data?.docs ?? [];
          return Container(
            margin: EdgeInsets.only(top: 21),
            height: 210,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 25, right: 6),
                itemCount: books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final book = books[index].data();

                  return Container(
                    margin: EdgeInsets.only(right: 19),
                    height: 180,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(book.image),
                        )),
                  );
                }),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
