import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.deepOrange.shade100),
      child: Stack(
        children: <Widget>[
          TextField(
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: 'RacingSansOne',
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 19, bottom: 10),
                border: InputBorder.none,
                hintText: 'Search for books',
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'RacingSansOne',
                )),
          ),
          Positioned(
            top: 3,
            right: 9,
            child: Icon(
              Icons.search,
              size: 37,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
