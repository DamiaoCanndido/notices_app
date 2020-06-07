import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notices/common/app_text_field/app_text_field.dart';
import 'package:notices/models/reminder_model.dart';
import 'package:notices/stores/reminder_store.dart';
import 'package:notices/utils/date_formatter.dart';
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
    _reminderStore.number = "";
    _reminderStore.subjects = "";
    _reminderStore.deadline = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova tarefa"),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              }),
              SizedBox(height: 8),
              Observer(builder: (_){
                return InkWell(
                  onTap: (){
                    _setDate();
                  },
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        _reminderStore.deadline != ""
                        ? DateFormatter.format(_reminderStore.deadline)
                        : "ESCOLHA O PRAZO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(32)
                    ),
                  ),
                );
              }),
              SizedBox(height: 24),
              Observer(builder: (_){
                return RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: EdgeInsets.all(10),
                  child: _reminderStore.loading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                  )
                  : Text("Salvar",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  disabledColor: Color.fromARGB(100, 0, 0, 102),
                  onPressed: _reminderStore.reminderPressed
                );
              })
            ],
          )
        ),
      ),
    );
  }

  _setDate(){
    DatePicker.showDateTimePicker(context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime(2020, 12, 31, 0, 0), 

      onConfirm: (date) {
        _reminderStore.deadline = date.toString();
      }, 
      currentTime: DateTime.now(), 
      locale: LocaleType.pt);
  }
}