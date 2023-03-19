import 'package:flutter/material.dart';
import 'package:flutter_project/MainPage.dart';

import 'MainPage.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const aboutUsPage(),
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
      routes: {
        '/MainPage': (context) => const MainPage(),
      },
    );
  }
}

class aboutUsPage extends StatefulWidget {
  const aboutUsPage({super.key});

  @override
  State<aboutUsPage> createState() => _aboutUsPageState();
}

class _aboutUsPageState extends State<aboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, '/MainPage'),
        ),
        title: const Text(
          'About Us',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
            height: 350,
            width: MediaQuery.of(context).size.width,
            child: const CircleAvatar(
              backgroundImage: AssetImage('asset/images/ohm.jpg'),
            )),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Supakitt Surojanakul\n6388065 Section 2",
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 5, 93, 160),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
            height: 350,
            width: MediaQuery.of(context).size.width,
            child: const CircleAvatar(
              backgroundImage: AssetImage('asset/images/noona.jpg'),
            )),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Paveena Kumnerdpun\n6388088 Section 2",
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 5, 93, 160),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
      ])),
    );
  }
}
