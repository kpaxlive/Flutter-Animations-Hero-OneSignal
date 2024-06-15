import 'package:flutter/material.dart';
import 'package:task_2/screens/eighth_page.dart';
import 'package:task_2/screens/fifth_page.dart';
import 'package:task_2/screens/fourth_page.dart';
import 'package:task_2/screens/home_page.dart';
import 'package:task_2/screens/ninth_page.dart';
import 'package:task_2/screens/second_page.dart';
import 'package:task_2/screens/seventh_page.dart';
import 'package:task_2/screens/sixth_page.dart';
import 'package:task_2/screens/third_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Hero",
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomePage(),
      '/secondPage': (context) => const SecondPage(),
      '/thirdPage': (context) => const ThirdPage(),
      '/fourthPage': (context) => const FourthPage(),
      '/fifthPage': (context) => const FifthPage(),
      '/sixthPage': (context) => const SixthPage(),
      '/seventhPage':(context) => const SeventhPage(),
      '/eighthPage':(context) => const EighthPage(),
      '/ninthPage':(context) => const NinthPage(),
    },
    initialRoute: '/',
  ));
}
