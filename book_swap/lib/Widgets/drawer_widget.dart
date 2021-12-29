import 'package:flutter/material.dart';
import 'dart:math';

class DrawerWidget extends StatefulWidget {
  Widget child = Container();
  DrawerWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState(child: child);
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Widget child = Container();
  _DrawerWidgetState({required this.child});
  @override
  Widget build(BuildContext context) {
    bool value = false;

    return Scaffold(
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
                      onTap: () {},
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
                      onTap: () {},
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
                      onTap: () {},
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
              tween: Tween<double>(begin: 0, end: (value ? 1 : 0)),
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
                        leading: IconButton(
                          icon: Icon(Icons.ac_unit),
                          onPressed: () {
                            setState(() {
                              value = !value;
                            });
                          },
                        ),
                      ),
                      body: child,
                    )));
              }),
          //      GestureDetector(

          //       onPanStart: ,

          //  //   onHorizontalDragUpdate: (e) {
          //    //if(e.delta.dx>0){
          //      //setState(() {
          //        //value=0;
          //      //});
          //    //}

          //     //},

          //      )
        ],
      ),
    );
  }
}
