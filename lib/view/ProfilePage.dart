import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/view/HomePage.dart';
import 'package:logger/logger.dart';

import '../model/CustomLogPrinter.dart';
import 'BottomNav.dart';

final logger = (Type type) => Logger(
      printer: CustomLogPrinter(type.toString()),
    );

class ProfilePage extends StatefulWidget {
  final String? email;

  const ProfilePage({Key? key, this.email}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Email:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.email!,
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[400], // Background color
                ),
                child: const Text(
                  'Log out',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  logger(ProfilePage).i('Click Logout Button');
                  _auth.signOut().then((value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    }));
                  });
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 2,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/CurrentLocationPage');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/SearchPage');
          }
        },
      ),
    );
  }
}
