import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2_flutter/provider/task.dart';
import 'package:todo2_flutter/widget/task_widget.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _tasks = Provider.of<Tasks>(context).tasks();

    return ListView.separated(
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(value: _tasks[i],child: TaskWidget()),
      itemCount: _tasks.length,
      separatorBuilder: (ctx,i) => Divider(
        thickness: 1.5,
        height: 0,
      ),
    );
  }
}
