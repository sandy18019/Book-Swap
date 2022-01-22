// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.userid,
    required this.email,
    this.firstName,
    this.lastName,
    this.avatar,
    this.booksList,
    this.cartList,
  });

  String userid;
  String? firstName;
  String? lastName;
  String email;
  String? avatar;
  List<String>? booksList;
  List<String>? cartList;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userid: json["userid"] as String,
        firstName: json['firstName'] as String,
        lastName: json["lastName"] as String,
        email: json['email'] as String,
        avatar: json['avatar'] as String,
        booksList: json["booksList"] == null
            ? []
            : List<String>.from(
                (json["booksList"]! as List<dynamic>).map((x) => x)),
        cartList: json["cartList"] == null
            ? []
            : List<String>.from(
                (json["cartList"]! as List<dynamic>).map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "email": email,
        "avatar": avatar ?? ' ',
        "firstName": firstName,
        "lastName": lastName,
        "booksList": booksList == null
            ? []
            : List<String>.from(booksList!.map((x) => x)),
        "cartList":
            cartList == null ? [] : List<String>.from(cartList!.map((x) => x)),
      };
}
