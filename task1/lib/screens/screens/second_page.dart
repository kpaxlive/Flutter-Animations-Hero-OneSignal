import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool showPercentage = false;
  double blurValue = 10.0;
  bool isProcessing = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sharpen Your Photo"),
        backgroundColor: Colors.indigo.shade300,
      ),
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 45),
            Container(
              height: 300,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/soldier.png"),
                      fit: BoxFit.cover)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                if (!isProcessing) {
                  startSharpening();
                } else {
                  stopSharpening();
                }
              },
              child: Text(isProcessing ? "Stop Sharpening" : "Sharpen Photo"),
            ),
            if (showPercentage)
              Center(
                child: Lottie.asset(
                  controller: _controller,
                  'assets/animations/loading_bar.json',
                  repeat: true,
                  height: 150,
                  width: 150,
                ),
              )
          ],
        ),
      ),
    );
  }

  void startSharpening() {
    setState(() {
      isProcessing = true;
      showPercentage = true;
      _controller.forward();
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (showPercentage) {
        setState(() {
          blurValue -= 1.7;
        });
        if (blurValue > 0) {
          startSharpening();
        } else {
          setState(() {
            isProcessing = false;
          });
        }
      }
    });
  }

  void stopSharpening() {
    setState(() {
      isProcessing = false;
      showPercentage = false;
      if (!_controller.isCompleted) {
        _controller.stop();
      }
    });
  }
}
