import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class NinthPage extends StatelessWidget {
  const NinthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        body: Stack(fit: StackFit.passthrough, children: [
          Positioned(
              top: MediaQuery.of(context).size.height - 625,
              left: 50,
              child: Hero(
                tag: 'arrow',
                child: Image.asset(
                  "assets/images/stick.png",
                  height: 60,
                  width: 60,
                ),
              )),
          Positioned(
              bottom: 300,
              left: 45,
              child: Column(
                children: [
                  Text("Congratulations",
                      style: GoogleFonts.euphoriaScript(
                          textStyle: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold))),
                  Text("You are out of the Maze!",
                      style: GoogleFonts.euphoriaScript(
                          textStyle: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold))),
                ],
              )),
          Positioned(
            bottom: 150,
            left: MediaQuery.of(context).size.width / 2 - 75,
            child: GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
              child: Container(
                alignment: Alignment.bottomRight,
                height: 70,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 240, 240, 240),
                ),
                child: Center(
                  child: Text("Go Home",
                      style: GoogleFonts.euphoriaScript(
                          textStyle: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w600))),
                ),
              ),
            ),
          ),
        ]));
  }
}
