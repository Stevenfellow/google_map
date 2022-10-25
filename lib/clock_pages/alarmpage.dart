import 'package:flutter/material.dart';
import 'package:google_map/theme/notification.dart';

import '../data/data.dart';
import '../main.dart';
import '../pages/index_page.dart';
import '../theme/theme.dart';
import 'clock_homepage.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  bool isSwitched = false;
  @override
  void initState() {
    super.initState();
    Noti.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
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
              buildMenuButton('Stopwatch', const Icon(Icons.stop)),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          const VerticalDivider(
            color: Colors.white24,
            width: 1,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Alarm',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              children: alarms.map((alarm) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: alarm.gradientColors,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: alarm.gradientColors.last.withOpacity(0.4),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: const Offset(4, 4)),
                      ],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24))),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: const <Widget>[
                                Icon(
                                  Icons.label,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Office',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeTrackColor: Colors.white,
                              activeColor: Colors.blue,
                            )
                          ],
                        ),
                        const Text(
                          'Mon - Fri',
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text(
                              '07:00 AM',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).followedBy([
                Container(
                  decoration: BoxDecoration(
                      color: CustomColors.clockBG,
                      borderRadius: BorderRadius.circular(24)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      Noti.showBigTextNotification(
                          title: "Message title",
                          body: "Long body",
                          fln: flutterLocalNotificationsPlugin);
                    },
                    child: Column(
                      children: const <Widget>[
                        Icon(Icons.add),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Add Alarm',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ]).toList(),
            ),
          )
        ],
      ),
    );
  }

  Padding buildMenuButton(String title, Icon icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: FloatingActionButton(
        backgroundColor: title == 'Alarm'
            ? const Color.fromARGB(255, 67, 0, 70)
            : const Color(0xFF2D2F41),
        onPressed: () {
          // var menuInfo = Provider.o
          if (title == 'Clock') {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const ClockHomePage())));
          }
          if (title == 'Alarm') {}
          if (title == 'Timer') {}
          if (title == 'Stopwatch') {}
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
