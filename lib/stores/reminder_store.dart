import 'package:mobx/mobx.dart';
import 'package:notices/models/reminder_model.dart';
import 'package:notices/repositores/reminders_api.dart';
part 'reminder_store.g.dart';

class ReminderStore = _ReminderStoreBase with _$ReminderStore;

abstract class _ReminderStoreBase with Store {

  @observable
  List<ReminderModel> reminders;

  @action
  Future<void> getReminders() async {
    reminders = await RemindersApi.getReminders();
    reminders.map((e) => e.number.toString());
  }

}