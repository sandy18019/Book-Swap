import 'package:book_swap/models/book_model.dart';
import 'package:book_swap/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final userFirestore = FirebaseFirestore.instance.collection('user');
final booksFirestore = FirebaseFirestore.instance.collection('books');

final userFirestoreRef =
    FirebaseFirestore.instance.collection('user').withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (userModel, _) => userModel.toJson(),
        );

final booksFirestoreRef =
    FirebaseFirestore.instance.collection('books').withConverter<BookModel>(
          fromFirestore: (snapshot, _) => BookModel.fromJson(snapshot.data()!),
          toFirestore: (bookModel, _) => bookModel.toJson(),
        );
