import 'package:book_swap/screens/LoadingScreen.dart';
import 'package:book_swap/screens/errorscreen.dart';
import 'package:book_swap/screens/extract_arguments.dart';
import 'package:book_swap/screens/profile_page.dart';
import 'package:book_swap/screens/addbook_screen.dart';
import 'package:book_swap/screens/cart_screen.dart';
import 'package:book_swap/screens/drawer_screen.dart';
import 'package:book_swap/screens/home_screen.dart';
import 'package:book_swap/screens/login_screen.dart';
import 'package:book_swap/screens/signup_screen.dart';
import 'package:book_swap/screens/splash_screen.dart';
import 'package:book_swap/services/authentication_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized ();
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  final _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationSrvice>(
          create: (_) => AuthenticationSrvice(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationSrvice>().authStateChanges,
          initialData: null,
        )
      ],
    
    // ignore: dead_code
    child : MaterialApp(
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorScreen();
          } else if (snapshot.hasData) {
            return AuthenticationWrapper();
          } else {
            return LoadingScreen();
          }
        },
      ),
      // initialRoute: '/',
      routes: {
        // '/': (context) => SplachScreen(),
        '/Loginscreen': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/cart': (context) => CartView(),
        '/addbook': (context) => AddBook(),
        '/homescreen': (context) => HomeScreen(),
        '/drawer': (context) => DrawerScreen(),
        '/profilepage': (context) => ProfilePage()
      },
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final args = settings.arguments as ScreenArguments;
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    )
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseUser = context.watch<User?>();
    if (FirebaseUser != null) {
      return HomeScreen();
    }
    return LoginScreen();
  }
}
