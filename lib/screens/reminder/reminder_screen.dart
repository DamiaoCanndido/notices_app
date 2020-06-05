import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:notices/common/custom_drawer/custom_drawer.dart';
import 'package:notices/models/reminder_model.dart';
import 'package:notices/stores/reminder_store.dart';
import 'package:notices/utils/date_formatter.dart';
import 'package:provider/provider.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {

  ReminderStore _reminderStore;
  List<ReminderModel> reminder;
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reminderStore = Provider.of<ReminderStore>(context);
    _reminderStore.getReminders();
    reminder = _reminderStore.reminders;

    disposer = reaction((_) => _reminderStore.loading, 
      (loading){
        if(_reminderStore.loading){
          _reminderStore.getReminders();
          _reminderStore.loading = false;
        }
      }
    );
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
                  ? Colors.green
                  : Colors.red
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
                            FlatButton(
                              onPressed: (){
                                _reminderStore.doneReminders(_reminderStore.reminders[index]);
                              }, 
                              child: _reminderStore.reminders[index].done 
                              ? Text(
                                "OK",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )
                              : Text(
                                "NÃO OK",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )
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
                          DateFormatter.timeLeft(_reminderStore.reminders[index].deadline)
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