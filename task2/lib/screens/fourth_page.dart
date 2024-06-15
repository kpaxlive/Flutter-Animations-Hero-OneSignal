import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
              top: MediaQuery.of(context).size.height - 650,
              left: 100,
              child: Hero(
                tag: 'arrow',
                child: Image.asset(
                  "assets/images/stick.png",
                  height: 60,
                  width: 60,
                ),
              )),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.transparent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showSomeError(context);
                      },
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/arrow_up.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showSomeError(context);
                          },
                          child: SizedBox(
                            child: Image.asset(
                              'assets/images/arrow_left.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 65,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, '/fifthPage');
                          },
                          child: SizedBox(
                            child: Image.asset(
                              'assets/images/arrow_right.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    GestureDetector(
                      onTap: () {
                        showSomeError(context);
                      },
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/arrow_down.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSomeError(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("You Died!",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            content: Text(
              "You lost in maze..",
              style: TextStyle(fontSize: 18),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                  child: Text("Return to menu")),
            ],
          );
        });
  }
}
