import 'dart:async';

import 'package:flutter/material.dart';

import '../home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'HabitsNow',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold, color: Color.fromARGB(255, 214, 32, 90),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Color.fromARGB(255, 214, 32, 90),
              ),
              strokeWidth: 11.0,
            ),
          ],
        ),
      ),
    );
  }
}
