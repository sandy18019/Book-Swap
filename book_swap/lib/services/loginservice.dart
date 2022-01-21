// import 'package:book_swap/models/loginuser.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class LoginService {


//   LoginService() {
//     Firebase.initializeApp();
//   }

//   LoginUserModel _userModel;
//   LoginUserModel get loggedInUserModel => _userModel;

  
//   Future<bool> signInWithGoogle() async {
//     GoogleSignIn googleSignIn = GoogleSignIn();

//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

//     if (googleUser == null) {
//       return false;
//     }

//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     final OAuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     UserCredential userCreds =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//     if (userCreds != null) {
//       _userModel = LoginUserModel(
//           displayName: userCreds.user.displayName,
//           email: userCreds.user.email,
//           photo: userCreds.user.photoURL);
//     }
//     return true;
//   }
// }
