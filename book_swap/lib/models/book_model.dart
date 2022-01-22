// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

List<BookModel> bookModelFromJson(String str) =>
    List<BookModel>.from(json.decode(str).map((x) => BookModel.fromJson(x)));

String bookModelToJson(List<BookModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookModel {
  BookModel({
    required this.bookId,
    required this.title,
    required this.author,
    required this.price,
    required this.image,
    required this.description,
  });

  String bookId;
  String title;
  String author;
  String price;
  String image;
  String description;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        bookId: json["bookId"],
        title: json["title"],
        author: json["author"],
        price: json["price"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "bookId": bookId,
        "title": title,
        "author": author,
        "price": price,
        "image": image,
        "description": description,
      };
}
