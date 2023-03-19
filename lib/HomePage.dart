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
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('/lib/images/scala_restaurant.jpg'),
          //     )
          //   )
        ),
        const Text(
          "Welcome to\nAirQua app",
          style: TextStyle(
            fontSize: 40,
            color: Colors.lightBlue,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Get real-time updates\non your air quality with just a tap",
          style: TextStyle(
            fontSize: 20,
            color: Colors.lightBlue,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 60,
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
        Expanded(
          child: Container(),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/MainPage'),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.lightBlue.shade900,
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                )),
          )
        ]),
        const SizedBox(
          height: 40,
        ),
      ]),
    );
  }
}
