import 'package:book_swap/models/cart_model.dart';
class CartView {
List<String>?name =  <String>[
   'Sherlock Holmes ',
   'Julus Caeser',
   'Prisoner of Zenda'
];
List<String>?img=<String>[
  'images/book1.jpg',
   'images/book2.jpg',
    'images/book3.jpg'
];


List<int>?price  = <int >[
 100,150,200
];
CartView({this.name,this.img,this.price});
}