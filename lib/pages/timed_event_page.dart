import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_map/timed_event_utilities/habit_tile.dart';

class TimedEventPage extends StatefulWidget {
  const TimedEventPage({super.key});

  @override
  State<TimedEventPage> createState() => _TimedEventPageState();
}

class _TimedEventPageState extends State<TimedEventPage> {
  List habitList = [
    //[habitName, habitStated, timeSpent{sec}, timeGoal {min}]
    ['Exercise', false, 0, 1],
    ['Read', false, 0, 20],
    ['Writing', false, 0, 20],
    ['Code', false, 0, 40],
  ];

  void habitStarted(int index) {
    var startTime = DateTime.now();

    //include the time already elapsed
    int elapsedTime = habitList[index][2];

    //habit started or stopped
    setState(() {
      habitList[index][1] = !habitList[index][1];
    });

    //keep the time going
    if (habitList[index][1]) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (habitList[index][1] == false) {
            timer.cancel();
          }

          var currentTime = DateTime.now();
          habitList[index][2] = elapsedTime +
              currentTime.second -
              startTime.second +
              60 * (currentTime.minute - startTime.minute) +
              60 * 60 * (currentTime.hour - startTime.hour);
        });
      });
    }
  }

  void settingsOpened(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Settings for ' + habitList[index][0]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Add event'),
          backgroundColor: Colors.grey.shade900,
        ),
        backgroundColor: Colors.grey.shade600,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: const Center(child: Text("TIMED EVENTS")),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListView.builder(
            itemCount: habitList.length,
            itemBuilder: ((context, index) {
              return TimedHabitTile(
                habitName: habitList[index][0],
                onTap: () {
                  habitStarted(index);
                },
                settingsTapped: () {
                  settingsOpened(index);
                },
                habitStarted: habitList[index][1],
                timeSpent: habitList[index][2],
                timeGoal: habitList[index][3],
              );
            })));
  }
}
