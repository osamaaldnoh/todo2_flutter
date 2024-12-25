import 'package:flutter/material.dart';
import 'package:todo2_flutter/screen/add_tasks_screen.dart';
import 'package:todo2_flutter/screen/completed_screen.dart';
import 'package:todo2_flutter/screen/in_progress_screen.dart';
import 'package:todo2_flutter/screen/tasks_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, dynamic>> _pages;

  int _currentIndex = 0;
  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'title': 'Tasks',
        'body': TasksScreen(),
      },
      {
        'title': 'In Progress',
        'body': InProgressScreen(),
      },
      {
        'title': 'Completed',
        'body': CompletedScreen(),
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_pages[_currentIndex]['title'])),
        body: _pages[_currentIndex]['body'],
        bottomNavigationBar: BottomNavigationBar(
            onTap: _changeIndex,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.task_alt), label: "Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined), label: "In Progress"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done_all), label: "Completed"),
            ]),
        floatingActionButton: _currentIndex == 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddTaskScreen.routeName);
                },
                child: Icon(Icons.add),
              )
            : null,
    );
  }
}
