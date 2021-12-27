import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class heading extends StatelessWidget{
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left: 25, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
           'hello UserName',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'RacingSansOne',
              color: Colors.grey
            ),
          ),
          Text(
           'Main Library',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'RacingSansOne',
              color: Colors.black
            ),
          ),
        ],
      )
    );
  }
}