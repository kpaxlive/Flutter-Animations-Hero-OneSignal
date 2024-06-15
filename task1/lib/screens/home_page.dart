import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Lottie.asset(
            'assets/animations/loading.json',
            repeat: true,
            height: 150,
            width: 150,
          )),
          const Text("Photo Sharpening is loading...",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  void startTimer() {
    int start = 6;
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            Navigator.pushReplacementNamed(context, '/secondPage');
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }
}
