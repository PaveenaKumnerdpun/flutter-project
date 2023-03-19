import 'package:flutter/material.dart';
import 'package:flutter_project/AboutUsPage.dart';
import 'package:flutter_project/HomePage.dart';
import 'package:flutter_project/MainPage.dart';
import 'package:flutter_project/SearchPage.dart';

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
      initialRoute: "/HomePage",
      routes: {
        "/HomePage": (context) => const HomePage(),
        '/MainPage': (context) => const MainPage(),
        '/AboutUsPage': (context) => const AboutUsPage(),
        '/SearchPage': (context) => const SearchPage(),
      },
    );
  }
}
