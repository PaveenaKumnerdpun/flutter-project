import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          width: 100,
          height: 50,
          margin: const EdgeInsets.only(top: 40),
        ),
        const Text(
          "Welcome to\nAirQua app",
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Get real-time updates\non your air quality with just a tap",
          style: TextStyle(
            fontSize: 20,
            color: Colors.blueGrey,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('asset/images/people.jpg'),
            fit: BoxFit.cover,
          )),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/LoginPage'),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                )),
          )
        ]),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/RegisterPage'),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blueGrey,
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                )),
          )
        ]),
      ]),
    );
  }
}
