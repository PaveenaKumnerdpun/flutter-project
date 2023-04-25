import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/view/HomePage.dart';
import 'package:flutter_project/view/MyPlacePage.dart';
import 'package:flutter_project/view/ProfilePage.dart';
import 'package:flutter_project/view/SearchPage.dart';
import 'package:flutter_project/view/LoginPage.dart';
import 'package:flutter_project/view/RegisterPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/HomePage',
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/RegisterPage': (context) => const RegisterPage(),
        '/LoginPage': (context) => const LoginPage(),
        '/CurrentLocationPage': (context) => const MyPlacePage(),
        '/SearchPage': (context) => const SearchPage(),
        '/ProfilePage': (context) => _buildProfilePage(context),
      },
    );
  }

  ProfilePage _buildProfilePage(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final String? email = user?.email;

    return ProfilePage(email: email);
  }
}
