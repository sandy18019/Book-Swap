import 'package:book_swap/screens/welcomescreen.dart';
import 'package:book_swap/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    bool value = false;

    return Consumer<AuthenticationSrvice>(builder: (context, authProvider, _) {
      return Drawer(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.lightBlue,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      authProvider.userModel!.avatar != ''
                          ? CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                authProvider.userModel!.avatar as String,
                              ),
                            )
                          : Container(
                              width: 90,
                              height: 90,
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
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        authProvider.userModel!.firstName.toString() +
                            ' ' +
                            authProvider.userModel!.lastName.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
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
                      onTap: () => authProvider.signOut().then((value) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => WelcomeScreen()),
                        );
                      }),
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
          ),
        ),
      );
    });
  }
}
