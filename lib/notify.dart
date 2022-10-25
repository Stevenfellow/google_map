// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'notification.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController Notification_title = TextEditingController();
  TextEditingController Notification_descrp = TextEditingController();

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("My Day"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: Notification_title,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Title",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: Notification_descrp,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Description",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  NotificationService().showNotification(
                      1, Notification_title.text, Notification_descrp.text);
                },
                child: Container(
                  height: 40,
                  width: 200,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      "Show Notification",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
