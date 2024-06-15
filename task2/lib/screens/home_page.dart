
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 500,
                width: 500,
                child: Lottie.asset('assets/animations/welcome.json')),
            const SizedBox(
              height: 10,
            ),
            Text("Welcome to Maze",
                style: GoogleFonts.euphoriaScript(
                    textStyle: const TextStyle(
                        fontSize: 45, fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, '/secondPage'),
              child: Container(
                alignment: Alignment.bottomRight,
                height: 70,
                width: 110,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 240, 240, 240),
                ),
                child: Center(
                  child: Text("Next",
                      style: GoogleFonts.euphoriaScript(
                          textStyle: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w600))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
