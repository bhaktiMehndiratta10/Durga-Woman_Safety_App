import 'package:Durga/firebase_options.dart';
import 'package:Durga/pages/login_page.dart';
import 'package:Durga/pages/register_page.dart'; // Import the Register Page
import 'package:Durga/auth/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(), // Main home screen
      routes: {
        '/login': (context) => LoginPage(showRegisterPage: () {
              Navigator.pushReplacementNamed(context, '/register');
            }), // Login page route
        '/register': (context) => RegisterPage(showLoginPage: () {
              Navigator.pushReplacementNamed(context, '/login');
            }), // Register page route
      },
    );
  }
}
