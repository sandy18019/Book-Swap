import 'package:book_swap/models/book_model.dart';
import 'package:book_swap/screens/cart/cart_provider.dart';
import 'package:book_swap/services/authentication_services.dart';
import 'package:book_swap/utils/ref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedBookScreen extends StatelessWidget {
  const SelectedBookScreen({
    required this.bookId,
    Key? key,
  }) : super(key: key);
  final String bookId;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationSrvice>(builder: (context, authProvider, _) {
      return Scaffold(
        body: FutureBuilder<DocumentSnapshot<BookModel>>(
          future: booksFirestoreRef.doc(bookId).get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              final book = snapshot.data!.data();
              return SafeArea(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
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
                                    image: NetworkImage(book!.image),
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
                          book.title,
                          style: TextStyle(
                              fontSize: 27,
                              color: Colors.black,
                              fontFamily: 'RacingSansOne'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7, left: 25),
                        child: Text(
                          book.author,
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
                                book.price,
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
                          book.description,
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
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
          height: 50,
          color: Colors.transparent,
          child: RawMaterialButton(
            fillColor: Colors.deepOrange.shade200,
            onPressed: () {
              authProvider.addToUserCart(bookId: bookId).then((value) {
                Navigator.pushNamed(context, '/cart');
              });
            },
            child: Text(
              'Add To Cart',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      );
    });
  }
}
