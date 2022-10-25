import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_map/clock_pages/clock_homepage.dart';
import 'package:google_map/googlemap.dart';
import 'package:google_map/pages/homepage.dart';
import 'package:google_map/pages/timed_event_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(15, 22, 2, 31),
      bottomNavigationBar: Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 177, 5, 177),
          child: Row(
            children: const [],
          )),
      body: Column(
        children: [
          Stack(
            children: [
              Transform.rotate(
                origin: const Offset(30, -60),
                angle: 2.4,
                child: Container(
                  margin: const EdgeInsets.only(left: 65, top: 35),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      gradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          colors: [
                            Color(0x0ffd88ab),
                            Color.fromARGB(255, 223, 7, 212)
                          ])),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "MY DAY",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Start the day with a plan and stick to it!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 177,
                                width: 155,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromARGB(159, 90, 1, 141)),
                                child: GestureDetector(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/icons8-to-do-list-65.png',
                                          width: 120,
                                          height: 120,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Todo Habits',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()));
                                    }),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 177,
                                width: 155,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromARGB(159, 90, 1, 141)),
                                child: GestureDetector(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/icons8-timer-new.png',
                                          width: 120,
                                          height: 120,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Timed Events',
                                          style: TextStyle(
                                              color: Colors.yellow.shade600,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const TimedEventPage()));
                                    }),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 177,
                                width: 155,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromARGB(159, 90, 1, 141)),
                                child: GestureDetector(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/icons8-clock-100.png',
                                          width: 120,
                                          height: 120,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Clock Actions',
                                          style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ClockHomePage()));
                                    }),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 177,
                                width: 155,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromARGB(159, 90, 1, 141)),
                                child: GestureDetector(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/icons8-locations-64.png',
                                          width: 120,
                                          height: 120,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Locations',
                                          style: TextStyle(
                                              color: Colors.yellow.shade800,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const GoogleMapp()));
                                    }),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
