import 'package:flutter/material.dart';
import 'package:notices/models/reminder_model.dart';

class ReminderCreate extends StatefulWidget {

  final ReminderModel reminder;

  ReminderCreate({this.reminder});

  @override
  _ReminderCreateState createState() => _ReminderCreateState();
}

class _ReminderCreateState extends State<ReminderCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova tarefa"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            
          ],
        )
      ),
    );
  }
}