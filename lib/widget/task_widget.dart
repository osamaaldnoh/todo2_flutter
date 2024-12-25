import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo2_flutter/screen/edit_screen.dart';
import 'package:todo2_flutter/screen/tasks_screen.dart';


import '../provider/task.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);


   void delete(BuildContext){print('Delete');}
  void Share() =>print('Share');
  void Archive() =>print('Archive');
  void Save() =>print('Save');

  @override
  Widget build(BuildContext context)
  {
    Task _task = Provider.of(context);

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.indigoAccent,
            child: FittedBox(
              child: Padding(padding: EdgeInsets.all(8.0),
                child: Text('${_task.time.format(context)}'),
              ),
            ),
            foregroundColor: Colors.white,
          ),
          title: Text('${_task.title}'),
          subtitle: Text('${DateFormat('yMMMd').format(_task.date)}'),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () => Provider.of<Tasks>(context,listen: false).removeTasks(_task.id),
      ),
        IconSlideAction(
          caption: 'Edit',
          color: Colors.grey,
          icon: Icons.edit,
          onTap: () {
            Navigator.pushNamed(context, EditTaskScreen.routeName,arguments: {
              'id': _task.id,
              'title': _task.title,
              'date': _task.date,
              'time': _task.time
            });
          },
        ),
        IconSlideAction(
          caption: 'In Progress',
          color: Colors.black45,
          icon: Icons.archive_outlined,
          onTap: () => Provider.of<Tasks>(context,listen: false).changeStatus(_task.id, Status.InProgress),
        ),

        IconSlideAction(
          caption: 'Complete',
          color: Colors.blue,
          icon: Icons.done_all,
          onTap: () => Provider.of<Tasks>(context,listen: false).changeStatus(_task.id, Status.Completed),
        ),
      ],
    );
  }
}
