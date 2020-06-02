import 'package:flutter/material.dart';
import 'package:notices/common/custom_drawer/custom_drawer.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prazos"),
      ),
      drawer: CustomDrawer(),
    );
  }
}