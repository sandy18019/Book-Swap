// import 'package:flutter/material.dart';
// import 'package:splash_screen_view/SplashScreenView.dart';

// class MySplashScreen extends StatefulWidget {
//   @override
//   State<SplashScreenView> createState() => _MySplashScreenState();
// }

// class _MySplashScreenState extends State<SplashScreenView> {
//   @override
//   void initState() {
//     Future.delayed(Duration(seconds: 4), () {
//       Navigator.pushNamed(context, '/LoginScreen');
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange.shade100,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/images/bookswap.png'),
//             Text(
//               'BOOKswap',
//               style: TextStyle(color: Colors.white, fontSize: 35.0),
//             ),
//             CircularProgressIndicator(
//               color: Colors.white,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
