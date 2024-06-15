import 'package:flutter/material.dart';
import 'package:task_1/screens/home_page.dart';
import 'package:task_1/screens/screens/second_page.dart';

void main() {
  runApp( MaterialApp(
    title: "Lottie",
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomePage(),
      '/secondPage': (context) => const SecondPage(),
    },
    initialRoute: '/',
  ));
}
