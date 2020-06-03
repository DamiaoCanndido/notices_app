import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:notices/common/custom_drawer/custom_drawer.dart';
import 'package:notices/stores/reminder_store.dart';
import 'package:notices/utils/date_formatter.dart';
import 'package:provider/provider.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {

  List<Map<String, dynamic>> list = [
    {
      "done": false,
      "_id": "5ed62f1039d49b27140ccb0f",
      "number": 20,
      "subjects": "Comer puta",
      "deadline": "2020-06-05T12:00:00.000Z",
    },
    {
      "done": true,
      "_id": "5ed549bb6bd0171d707b86df",
      "number": 30,
      "subjects": "Testando...",
      "deadline": "2020-06-10T16:00:00.000Z",
    }
  ];

  ReminderStore _reminderStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reminderStore = Provider.of<ReminderStore>(context);
    _reminderStore.getReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prazos"),
      ),
      body: Observer(
        builder: (_) {
        return _reminderStore.reminders != null 
        ? ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: _reminderStore.reminders.length,
          itemBuilder: (context, index){
            return Card(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: _reminderStore.reminders[index].done 
                  ? Colors.green[300]
                  : Colors.red[300] 
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(
                                  _reminderStore.reminders[index].number.toString(),
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: Text(
                                  _reminderStore.reminders[index].subjects,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Checkbox(
                              value: _reminderStore.reminders[index].done, onChanged: null
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          DateFormatter.format(_reminderStore.reminders[index].deadline)
                        ),
                      )
                    )
                  ],
                ),
              ),
            );
          }
        )
        : Center(child: CircularProgressIndicator());
      }),
      drawer: CustomDrawer(),
    );
  }
}