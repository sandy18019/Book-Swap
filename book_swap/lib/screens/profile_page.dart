// import 'package:flutter/material.dart';
// import 'package:book_swap/models/user.dart';
// import 'package:book_swap/widgets/appbar_widget.dart';
// import 'package:book_swap/widgets/button_widget.dart';
// import 'package:book_swap/widgets/profile_widget.dart';
// import 'package:book_swap/widgets/library_widget.dart';
// import 'package:book_swap/utils/user_preferences.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     final user = UserPreferences.myUser;

//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: ListView(
//         physics: BouncingScrollPhysics(),
//         children: [
//           ProfileWidget(
//             imagePath: user.imagePath,
//             onClicked: () async {},
//           ),
//           const SizedBox(height: 24),
//           buildName(user),
//           const SizedBox(height: 24),
//           Center(child: buildAddButton()),
//           const SizedBox(height: 24),
//           const SizedBox(height: 48),
//           buildLibrary(user),
//           const SizedBox(height: 35),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               GestureDetector(
//                   onTap: () {},
//                   child: SizedBox(
//                       width: 120.0,
//                       height: 160.0,
//                       child: Card(
//                         color: Colors.deepOrange.shade200,
//                         elevation: 2.0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0)),
//                         child: Center(
//                           child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   Image.asset(
//                                     'assets/images/book1.jpg',
//                                     width: 50,
//                                   ),
//                                   const SizedBox(height: 10.0),
//                                   const Text('sherlock',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 12,
//                                       )),
//                                   const SizedBox(height: 5.0),
//                                   const Text('112 EGP',
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w600))
//                                 ],
//                               )),
//                         ),
//                       ))),
//               GestureDetector(
//                   onTap: () {},
//                   child: SizedBox(
//                       width: 120.0,
//                       height: 160.0,
//                       child: Card(
//                         color: Colors.deepOrange.shade200,
//                         elevation: 2.0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0)),
//                         child: Center(
//                           child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   Image.asset(
//                                     'assets/images/book2.jpg',
//                                     width: 55.0,
//                                   ),
//                                   const SizedBox(height: 10.0),
//                                   const Text('Zenda',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 12,
//                                       )),
//                                   const SizedBox(height: 5.0),
//                                   const Text('90 EGP',
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w600))
//                                 ],
//                               )),
//                         ),
//                       ))),
//               GestureDetector(
//                   onTap: () {},
//                   child: SizedBox(
//                       width: 120.0,
//                       height: 160.0,
//                       child: Card(
//                         color: Colors.deepOrange.shade200,
//                         elevation: 2.0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0)),
//                         child: Center(
//                           child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   Image.asset(
//                                     'assets/images/book3.jpg',
//                                     width: 55.0,
//                                   ),
//                                   const SizedBox(height: 10.0),
//                                   const Text('juluis',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 12,
//                                       )),
//                                   const SizedBox(height: 5.0),
//                                   const Text('85 EGP',
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w600))
//                                 ],
//                               )),
//                         ),
//                       )))
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget buildName(User user) => Column(
//         children: [
//           Text(
//             user.name,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             user.email,
//             style: TextStyle(color: Colors.grey),
//           )
//         ],
//       );

//   Widget buildAddButton() => ButtonWidget(
//         text: 'Add a new Book',
//         onClicked: () {
//           Navigator.pushNamed(context, '/addbook');
//         },
//       );

//   Widget buildLibrary(User user) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 48),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'My Library',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               user.about,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             ),
//           ],
//         ),
//       );
// }
