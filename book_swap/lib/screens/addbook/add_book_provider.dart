import 'dart:io';

import 'package:book_swap/utils/ref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBookProvider extends ChangeNotifier {
  XFile? imageFile;
  bool isUploading = false;
  final ImagePicker _picker = ImagePicker();

  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadBook({
    required String title,
    required String price,
    required String description,
    required String author,
    required BuildContext context,
  }) async {
    isUploading = true;
    notifyListeners();

    final user = FirebaseAuth.instance.currentUser;
    final bookRef = booksFirestore.doc();

    final imageUrl = await uploadImage(imageFile!)
        .whenComplete(() => print("Image uploaded to firebase storage"));

    bookRef.set({
      'bookId': bookRef.id,
      'image': imageUrl,
      'title': title,
      'price': price,
      'description': description,
      'author': author
    }).then((value) async {
      imageFile = null;
      print("book Added");
      isUploading = false;
      notifyListeners();
      await userFirestore.doc(user!.uid).update({
        'booksList': FieldValue.arrayUnion([bookRef.id]),
      }).then((value) => Navigator.of(context).pop());
    }).catchError((error) => print("Failed to add book: $error"));
  }

  Future<void> pickImage({
    required ImageSource imageSource,
  }) async {
    try {
      XFile? image = await _picker.pickImage(
        source: imageSource,
        imageQuality: 25,
      );
      if (image != null) {
        imageFile = image;
      }
    } catch (e) {
      print("Image picker error ==>>$e");
    }
    notifyListeners();
  }

  Future<String> uploadImage(XFile _image) async {
    final firebaseUserMail = FirebaseAuth.instance.currentUser!.email;

    final ref = storage.ref().child(
          '$firebaseUserMail/bookImage/${Uri.file(_image.path).pathSegments.last}',
        );

    final value = await ref.putFile(File(_image.path));
    return value.ref.getDownloadURL();
  }

  void showPicker(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                trailing: const Icon(Icons.photo_library_outlined),
                title: const Text(
                  'Library',
                ),
                onTap: () {
                  pickImage(
                    imageSource: ImageSource.gallery,
                  );
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                trailing: const Icon(Icons.photo_camera_outlined),
                title: const Text(
                  'Camera',
                ),
                onTap: () {
                  pickImage(
                    imageSource: ImageSource.camera,
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
