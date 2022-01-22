import 'package:book_swap/services/authentication_services.dart';
import 'package:book_swap/utils/ref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  Future<void> addToUserCart({
    required String bookId,
    required BuildContext context,
  }) {
    final user = FirebaseAuth.instance.currentUser;

    return userFirestore
        .doc(user!.uid)
        .update(
          {
            'cartList': FieldValue.arrayUnion([bookId]),
          },
        )
        .then((value) => print("Book Added To Cart"))
        .then((value) =>
            Provider.of<AuthenticationSrvice>(context, listen: false)
                .getUserModel())
        .catchError((error) => print("Failed to add book: $error"));
  }
}
