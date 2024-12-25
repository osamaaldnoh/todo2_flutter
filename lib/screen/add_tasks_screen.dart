import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/task.dart';

class AddTaskScreen extends StatefulWidget {
  static const routeName = 'add_task_screen';
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var _timeController = TextEditingController();
  var _dateController = TextEditingController();
  var _titleController = TextEditingController();
  TimeOfDay? _selectTime;

  void _selectedDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 7),
      ),
    ).then((value) => setState(() => _dateController.text =
        DateFormat.yMMMd().format(value ?? DateTime.now())));
  }

  void _selectedTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) => setState(() {
              _selectTime = value ?? TimeOfDay.now();
              _timeController.text =
                  value?.format(context) ?? TimeOfDay.now().format(context);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                  prefixIcon: Icon(Icons.title)),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              readOnly: true,
              controller: _dateController,
              onTap: () => _selectedDate(),
              decoration: InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.date_range)),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              readOnly: true,
              controller: _timeController,
              onTap: _selectedTime,
              decoration: InputDecoration(
                  labelText: 'Time',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.schedule_outlined)),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {
                Provider.of<Tasks>(context, listen: false).addTask(
                    _titleController.text,
                    DateFormat.yMMMd().parse(_dateController.text),
                    _selectTime!);
                Navigator.pop(context);
              },
              child: Text(
                "Add",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
