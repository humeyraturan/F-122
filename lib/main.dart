import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/e_ticaret/pages/CartPage.dart';
import 'package:flutter_application_1/e_ticaret/pages/ItemPage.dart';
import 'package:flutter_application_1/e_ticaret/pages/ticaret_homepage.dart';
import 'package:flutter_application_1/eticaret.dart';
import 'package:flutter_application_1/hakk%C4%B1m%C4%B1zda.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/pages/auth/sign_up.dart';
import 'package:flutter_application_1/scanner.dart';

import 'firebase_options.dart';
import 'glutensiz_map.dart';

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
      routes: {
        "/loginPage": (context) => const LoginPage(),
        "/signUp": (context) => SignUp(),
        "/homePage": (context) => const HomePage(),
        "/eticaret": (context) => const Eticaret(),
        "/scanner": (context) => const Scanner(),
        "/mekanlar": (context) => const GlutensizMap(),
        "/hakkımızda": (context) => const Hakkimizda(),
        "/eticaret": (context) => const ticaret_homepage(),
        "/itemPage": (context) => ItemPage(),
        "/cartPage": (context) => CartPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginPage(),
    );
  }
}
