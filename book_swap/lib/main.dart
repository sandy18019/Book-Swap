import 'package:book_swap/screens/addBook/add_book_provider.dart';
import 'package:book_swap/screens/addbook/add_book_screen.dart';
import 'package:book_swap/screens/cart/cart_screen.dart';
import 'package:book_swap/screens/extract_arguments.dart';
import 'package:book_swap/screens/home_screen.dart';
import 'package:book_swap/screens/login_screen.dart';
import 'package:book_swap/screens/signup_screen.dart';
import 'package:book_swap/screens/splash_screen.dart';
import 'package:book_swap/screens/welcomescreen.dart';
import 'package:book_swap/services/authentication_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthenticationSrvice>(
            create: (_) => AuthenticationSrvice(),
          ),
          ChangeNotifierProvider<AddBookProvider>(
            create: (_) => AddBookProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(
            duration: 3,
            goToPage: user != null ? HomeScreen() : const WelcomeScreen(),
          ),
          // home: user != null ? HomeScreen() : const WelcomeScreen(),
          // initialRoute: '/',
          routes: {
            '/Loginscreen': (context) => LoginScreen(),
            '/signup': (context) => SignupScreen(),
            '/cart': (context) => CartView(),
            '/addbook': (context) => AddBookPage(),
            '/homescreen': (context) => HomeScreen(),
            // '/drawer': (context) => DrawerScreen(),
            // '/profilepage': (context) => ProfilePage()
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
        ));
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
