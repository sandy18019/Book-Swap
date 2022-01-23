import 'package:book_swap/models/book_model.dart';
import 'package:book_swap/screens/cart/cart_provider.dart';
import 'package:book_swap/services/authentication_services.dart';
import 'package:book_swap/utils/ref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Consumer<AuthenticationSrvice>(builder: (context, authProvider, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange.shade200,
          title: Text("Cart"),
        ),
        body: authProvider.userModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: authProvider.userModel?.cartList!.length,
                        itemBuilder: (context, index) {
                          final bookIds =
                              authProvider.userModel?.cartList![index];
                          return FutureBuilder<DocumentSnapshot<BookModel>>(
                            future: booksFirestoreRef.doc(bookIds).get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text("Something went wrong");
                              }

                              if (snapshot.hasData && !snapshot.data!.exists) {
                                return Text("Document does not exist");
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                final book = snapshot.data!.data();

                                return Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 250,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            height: double.infinity,
                                            child: Image.network(
                                              book!.image,
                                              fit: BoxFit.contain,
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                book.title,
                                                style: TextStyle(fontSize: 18),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '\EGP' + ' ' + book.price,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: 120,
                                                height: 25,
                                                color:
                                                    Colors.deepOrange.shade200,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      '1',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                        bottom: 100,
                                                      ),
                                                      child: Icon(
                                                        Icons.minimize,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ));
                              }

                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('TOTAL',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black)),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '450',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          height: 100,
                          width: 180,
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            ),
                            onPressed: () {
                              authProvider.emptyCart();
                              print("The Owner Will contact you shortly");
                              Navigator.pushNamed(context, '/homescreen');
                            },
                            child: Text('CHECKOUT'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
