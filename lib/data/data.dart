import 'package:google_map/models/alarmmodel.dart';
import 'package:google_map/theme/theme.dart';

// List<MenuInfo> menuItems = [
//   MenuInfo(MenuType.clock, title: 'Clock'),
//   MenuInfo(MenuType.alarm, title: 'Alarm'),
//   MenuInfo(MenuType.timer, title: 'Timer'),
//   MenuInfo(MenuType.stopwatch, title: 'Stopwatch'),
// ];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),
      description: 'Office',
      isActive: false,
      gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)),
      description: 'Sport',
      isActive: false,
      gradientColors: GradientColors.sunset)
];
