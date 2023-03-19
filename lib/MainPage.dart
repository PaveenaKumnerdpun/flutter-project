import 'dart:developer';

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    log("something");
    return const mainPage();
  }
}

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).pop(context),
        ),
        title: const Text(
          'Main Page',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            child: const Text('Open About Us Page'),
            onPressed: () => Navigator.of(context).pushNamed("/AboutUsPage"),
          ),
          ElevatedButton(
            child: const Text('Open Search page'),
            onPressed: () => Navigator.of(context).pushNamed("/SearchPage"),
          ),
        ]),
      ),
    );
  }
}
