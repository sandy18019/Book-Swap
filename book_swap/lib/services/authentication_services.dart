import 'package:book_swap/models/user.dart';
import 'package:book_swap/utils/ref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthenticationSrvice with ChangeNotifier {
  AuthenticationSrvice() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      getUserModel();
    }
  }
  FirebaseAuth auth = FirebaseAuth.instance;
  final fireStoreInstance = FirebaseFirestore.instance;
  bool isLoadingSignUp = false;
  bool isLoadingSignIn = false;
  User? user;
  UserModel? userModel;

  Future<User?> registrationWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    UserCredential userCredential;
    isLoadingSignUp = true;
    notifyListeners();

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      print("RegistrationEmailUser : $user");

      final checkUser = await userFirestore.doc(user!.uid).get();

      if (checkUser.exists) {
        Fluttertoast.showToast(msg: ' User exists on the database');
      } else {
        final _userModel = UserModel(
          userid: user!.uid,
          email: email,
          firstName: firstName,
          lastName: lastName,
        );

        final userDoc = userFirestore.doc(user!.uid);
        userDoc.set(_userModel.toJson()).whenComplete(() {
          print("User added to the database");
        }).catchError((e) => print(e));

        final getUser = await userFirestoreRef.doc(user!.uid).get();
        userModel = getUser.data();
        notifyListeners();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Failed to sign in with Email & Password. $e');
    }
    isLoadingSignUp = false;
    notifyListeners();
    return user;
  }

  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    isLoadingSignIn = true;
    notifyListeners();
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      final getUser = await userFirestoreRef.doc(user!.uid).get();
      userModel = getUser.data();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
      }
      print(e);
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Failed to sign in with Email & Password. $e');
      print(e);
    }
    isLoadingSignIn = false;
    notifyListeners();
    return user;
  }

  Future<void> signOut() async {
    try {
      user = null;
      await auth.signOut();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error signing out. Try again. $e');
    }
  }

  Future<void> getUserModel() async {
    final user = FirebaseAuth.instance.currentUser;

    return userFirestoreRef.doc(user!.uid).get().then((value) {
      userModel = value.data();
      print(value.data()!.toJson());
      notifyListeners();
    }).catchError((error) => print("Failed to add book: $error"));
  }

  Future<void> addToUserCart({
    required String bookId,
  }) {
    final user = FirebaseAuth.instance.currentUser;

    return userFirestore
        .doc(user!.uid)
        .update(
          {
            'cartList': FieldValue.arrayUnion([bookId]),
          },
        )
        .then((value) => print("book added to cart"))
        .then((value) => getUserModel())
        .catchError((error) => print("Failed to add Book: $error"));
  }
}
