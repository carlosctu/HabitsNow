import 'dart:async';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  State<SplashPage> createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
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