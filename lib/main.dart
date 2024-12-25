import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2_flutter/provider/task.dart';
import 'package:todo2_flutter/screen/add_tasks_screen.dart';
import 'package:todo2_flutter/screen/edit_screen.dart';
import 'package:todo2_flutter/screen/tab_screen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Tasks(),)
      ],
      child: MaterialApp(
        routes: {
          '/': (_) => TabScreen(),
          AddTaskScreen.routeName: (_) => AddTaskScreen(),
          EditTaskScreen.routeName: (_) => EditTaskScreen(),
        },

      ),
    );
  }
}
