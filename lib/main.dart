import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:llsps_new/screens/business_screen.dart';
import 'package:llsps_new/screens/directory_screen.dart';
import 'package:llsps_new/screens/home_screen.dart';
import 'package:llsps_new/screens/login_screen.dart';
import 'package:llsps_new/screens/signup_screen.dart';
import 'package:llsps_new/screens/profile_screen.dart';
import 'package:llsps_new/widgets/bottom_nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LLSPS',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute:
      FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/signup': (_) => const SignupScreen(),
        '/home': (_) => const BottomNav(),
        '/profile': (_) => const ProfileScreen(),
        '/directory': (_) => const DirectoryScreen(),
        '/business': (_) =>  BusinessScreen(),
      },
    );
  }
}