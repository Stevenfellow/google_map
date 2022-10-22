import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_map/clock_pages/alarmpage.dart';
import 'package:google_map/notification.dart';
import 'package:google_map/notify.dart';
import 'package:google_map/pages/clock_view.dart';
import 'package:google_map/pages/index_page.dart';

import 'package:intl/intl.dart';

class ClockHomePage extends StatefulWidget {
  const ClockHomePage({super.key});

  @override
  State<ClockHomePage> createState() => _ClockHomePageState();
}

class _ClockHomePageState extends State<ClockHomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    // ignore: avoid_print
    print(timezoneString);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 67, 0, 70),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const IndexPage())));
          },
          label: const Text('Homepage')),
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          const SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildMenuButton('Clock', const Icon(Icons.lock_clock_rounded)),
              buildMenuButton('Alarm', const Icon(Icons.alarm)),
              buildMenuButton('Timer', const Icon(Icons.timer)),
              buildMenuButton('Notifications', const Icon(Icons.stop)),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          const VerticalDivider(
            color: Colors.white24,
            width: 2,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'Clock',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedTime,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 54),
                        ),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 5,
                      fit: FlexFit.tight,
                      child: Align(
                          alignment: Alignment.center,
                          child: ClockView(
                            size: MediaQuery.of(context).size.height / 4,
                          ))),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Timezone',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'UTC$offsetSign$timezoneString',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMenuButton(String title, Icon icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: FloatingActionButton(
        backgroundColor: title == 'Clock'
            ? const Color.fromARGB(255, 67, 0, 70)
            : const Color(0xFF2D2F41),
        onPressed: () {
          // var menuInfo = Provider.o
          if (title == 'Alarm') {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const AlarmPage())));
          }
          if (title == 'Timer') {
            Navigator.of(context).pop();
          }
          if (title == 'Notifications') {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const MyHomePage(title: 'Welcome'))));
          }
        },
        child: Column(
          children: <Widget>[
            // Image.asset(
            //   image,
            //   scale: 1.5,
            // ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
