import 'package:mobx/mobx.dart';
import 'package:notices/models/reminder_model.dart';
import 'package:notices/repositores/reminders_api.dart';
import 'package:notices/utils/api_response.dart';
part 'reminder_store.g.dart';

class ReminderStore = _ReminderStoreBase with _$ReminderStore;

abstract class _ReminderStoreBase with Store {

  @observable
  List<ReminderModel> reminders;
  @observable
  ApiResponse<ReminderModel> reminderModel;
  @observable
  bool loading = false;

  @action
  Future<void> getReminders() async {
    reminders = await RemindersApi.getReminders();
    reminders.map((e) => e.number.toString());
  }

  @action
  Future<void> doneReminders(ReminderModel reminder) async {

    loading = true;
    
    reminderModel = await RemindersApi.doneReminder(reminder);

    loading = false;

  }

}