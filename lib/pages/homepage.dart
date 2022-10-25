import 'package:flutter/material.dart';

import 'package:google_map/components/habit_tile.dart';
import 'package:google_map/components/new_habit_box.dart';
import 'package:google_map/data/habit_database.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../components/fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    } else {
      db.loadData();
    }

    db.updateDatabase();
    super.initState();
  }

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todayHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

  final _newHabitNameController = TextEditingController();
  void createNewhabit() {
    showDialog(
        context: context,
        builder: (context) {
          return NewHabitBox(
            controller: _newHabitNameController,
            hintText: 'Enter Habit Name',
            onSave: saveNewHabit,
            onCancel: cancelNewHabit,
          );
        });
  }

  void saveNewHabit() {
    setState(() {
      db.todayHabitList.add([_newHabitNameController.text, false]);
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void cancelNewHabit() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return NewHabitBox(
            controller: _newHabitNameController,
            hintText: db.todayHabitList[index][0],
            onSave: () => saveExistingHabit(index),
            onCancel: cancelNewHabit);
      },
    );
  }

  void saveExistingHabit(int index) {
    setState(() {
      db.todayHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteHabit(int index) {
    setState(() {
      db.todayHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[500],
        floatingActionButton: MyFloatingActionButton(
          onPressed: createNewhabit,
        ),
        appBar: AppBar(
          title: const Center(child: Text("HABIT LIST")),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListView(
          children: [
            // MonthlySummary(
            //     datasets: db.heatMapDataSet,
            //     startDate: _myBox.get("START_DATE")),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: db.todayHabitList.length,
              itemBuilder: (context, index) {
                return HabitTile(
                    habitName: db.todayHabitList[index][0],
                    habitCompleted: db.todayHabitList[index][1],
                    onChanged: (value) => checkBoxTapped(value, index),
                    settingsTapped: (context) => openHabitSettings(index),
                    deleteTapped: (context) => deleteHabit(index));
              },
            ),
          ],
        ));
  }
}
