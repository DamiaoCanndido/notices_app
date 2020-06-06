import 'package:flutter/material.dart';
import 'package:notices/models/reminder_model.dart';
import 'package:notices/stores/reminder_store.dart';
import 'package:notices/utils/date_formatter.dart';
import 'package:provider/provider.dart';

class ReminderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ReminderStore _reminderStore = Provider.of<ReminderStore>(context);
    List<ReminderModel> reminder = _reminderStore.reminders;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: _reminderStore.reminders.length,
      itemBuilder: (context, index){

        ReminderModel rmd = reminder[index];

        return Card(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: rmd.done
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
                              rmd.number.toString(),
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
                              rmd.subjects,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: (){
                            _reminderStore.doneReminders(rmd);
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
    );
  }
}