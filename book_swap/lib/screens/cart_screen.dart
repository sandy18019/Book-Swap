import 'package:book_swap/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    Cart cart = Cart();
    List<String> img = cart.img!;
    List<String> name = cart.name!;
    List<int> price = cart.price!;
    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.lightBlue,
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
            ),
            SafeArea(
                child: Container(
              width: 200,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            NetworkImage("https://picsum.photos/250?image=9"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Sandy Elias ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )),
                  Expanded(
                      child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/homepage');
                        },
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/profilepage');
                        },
                        leading: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Settings",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        leading: Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            )),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: value),
                duration: Duration(milliseconds: 600),
                builder: (_, double val, __) {
                  return (Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..setEntry(0, 3, 200 * val)
                        ..rotateY((pi / 6) * val),
                      child: Scaffold(
                        appBar: AppBar(
                          title: Text("Drawer Menu"),
                        ),
                        body: Column(
                          children: [
                            Expanded(
                              child: Container(
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        height: 250,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.all(10),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                height: double.infinity,
                                                child: Image.asset(
                                                  img[index],
                                                  fit: BoxFit.contain,
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 40),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    name[index],
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    price[index].toString(),
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 18),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    width: 120,
                                                    height: 25,
                                                    color: Colors.grey.shade200,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.add,
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          '1',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                            bottom: 100,
                                                          ),
                                                          child: Icon(
                                                            Icons.minimize,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                  itemCount: name.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: 10,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('TOTAL',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.grey)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        '2000',
                                        style: TextStyle(),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    height: 100,
                                    width: 180,
                                    child: TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                      ),
                                      onPressed: () {},
                                      child: Text('CHECKOUT'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )));
                }),
            GestureDetector(
              onTap: () {
                setState(() {
                  value == 0 ? value = 1 : value = 0;
                });
              },
              //   onHorizontalDragUpdate: (e) {
              //if(e.delta.dx>0){
              //setState(() {
              //value=0;
              //});
              //}

              //},
            )
          ],
        ),
      ),
    );
  }
}
