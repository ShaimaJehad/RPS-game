import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int userchoice = 1;
  int systemchoice = 1;

  bool isPlay = false;
  List<String> messages = ['You Win', 'System Win', 'no one win'];
  String message = '';
  Duration duration = const Duration(milliseconds: 250);
  void choice(int mychoice) {
    setState(() {
      userchoice = mychoice;
      systemchoice = Random.secure().nextInt(3) + 1;
      if (userchoice == 1 && systemchoice == 2 ||
          userchoice == 2 && systemchoice == 3 ||
          userchoice == 3 && systemchoice == 1) {
        message = messages[0];
      } else if (userchoice == systemchoice) {
        message = messages[2];
      } else {
        message = messages[1];
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Center(
              child: Text(
                'ROCK SCISSORS PAPER',
                style: TextStyle(color: Colors.white),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.purple.shade300),
        backgroundColor: Colors.purple,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    AnimatedScale(
                      scale: isPlay ? 1.5 : 1.0,
                      duration: duration,
                      child: Image.asset(
                        'assets/img$userchoice.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'You',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'vs',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    AnimatedScale(
                      scale: isPlay ? 1.5 : 1.0,
                      duration: duration,
                      child: Image.asset(
                        'assets/img$systemchoice.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'System',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey.shade500,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      isPlay = true;
                    });
                    Timer(duration, () {
                      setState(() {
                        choice(1);

                        isPlay = false;
                      });
                    });
                  },
                  child: Image.asset(
                    'assets/img1.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isPlay = true;
                    });
                    Timer(duration, () {
                      setState(() {
                        choice(3);
                        isPlay = false;
                      });
                    });
                  },
                  child: Image.asset(
                    'assets/img3.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isPlay = true;
                });
                Timer(duration, () {
                  choice(2);
                  isPlay = false;
                });
              },
              child: Image.asset(
                'assets/img2.png',
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
