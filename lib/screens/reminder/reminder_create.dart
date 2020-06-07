import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notices/common/app_text_field/app_text_field.dart';
import 'package:notices/models/reminder_model.dart';
import 'package:notices/stores/reminder_store.dart';
import 'package:provider/provider.dart';

class ReminderCreate extends StatefulWidget {

  final ReminderModel reminder;

  ReminderCreate({this.reminder});

  @override
  _ReminderCreateState createState() => _ReminderCreateState();
}

class _ReminderCreateState extends State<ReminderCreate> {

  ReminderStore _reminderStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reminderStore = Provider.of<ReminderStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova tarefa"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Observer(builder: (_){
              return AppTextField(
                textAlign: TextAlign.center,
                label: "Número",
                errorText: _reminderStore.errorNumber,
                prefix: Icon(Icons.folder),
                enabled: true,
                onChanged: _reminderStore.setNumber,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              );
            }),
            SizedBox(height: 8),
            Observer(builder: (_){
              return AppTextField(
                textAlign: TextAlign.start,
                label: "Assunto",
                errorText: _reminderStore.errorSubjects,
                keyboardType: TextInputType.text,
                prefix: Icon(Icons.note_add),
                enabled: true,
                onChanged: _reminderStore.setSubjects,
              );
            })
          ],
        )
      ),
    );
  }
}