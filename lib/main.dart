import 'package:flutter/material.dart';
import 'package:flutter_project/view/AboutUsPage.dart';
import 'package:flutter_project/view/HomePage.dart';
import 'package:flutter_project/view/MainPage.dart';
import 'package:flutter_project/view/SearchPage.dart';
import 'package:flutter_project/view/LoginPage.dart';
import 'package:flutter_project/view/RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: '/HomePage',
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/LoginPage': (context) => const LoginPage(),
        '/RegisterPage': (context) => const RegisterPage(),
        '/CurrentLocationPage': (context) => const CurrentLocationPage(),
        '/AboutUsPage': (context) => const AboutUsPage(),
        '/SearchPage': (context) => const SearchPage(),
      },
    );
  }
}
