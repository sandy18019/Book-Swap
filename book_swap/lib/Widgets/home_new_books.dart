import 'package:book_swap/models/new_model.dart';
import 'package:flutter/cupertino.dart';

class newBooks extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 21),
      height: 210,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 25, right: 6),
          itemCount: newbooks.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 19),
              height: 180,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(newbooks[index].image),
                  )),
            );
          }),
    );
  }
}
