import 'dart:io';
import 'package:book_swap/helpers/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_book_provider.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({Key? key}) : super(key: key);

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _authorController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AddBookProvider>(builder: (context, addBookProvider, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.Main_color,
          title: Text("Add Book"),
          elevation: 1,
          leading: BackButton(
            color: Colors.red[300],
            onPressed: () {
              Navigator.pushNamed(context, '/homescreen');
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.red[300],
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.red[300],
                          child: addBookProvider.imageFile != null
                              ? CircleAvatar(
                                  radius: 60,
                                  backgroundImage: FileImage(
                                    File(addBookProvider.imageFile!.path),
                                  ),
                                )
                              : Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Colors.red[300],
                                  ),
                                ),
                        ),
                        IconButton(
                          onPressed: () => addBookProvider.showPicker(context),
                          icon: CircleAvatar(
                            backgroundColor: Colors.red[300],
                            radius: 20,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[200],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    controller: _titleController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('PLEASE enter A title');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Book Name',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _authorController,
                    decoration: InputDecoration(
                      labelText: 'Author',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  addBookProvider.isUploading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              addBookProvider.uploadBook(
                                context: context,
                                title: _titleController.text,
                                price: _priceController.text,
                                description: _descriptionController.text,
                                author: _authorController.text,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red[300],
                            elevation: 2,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.white,
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
