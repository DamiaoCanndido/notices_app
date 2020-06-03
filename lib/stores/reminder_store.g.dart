// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReminderStore on _ReminderStoreBase, Store {
  final _$remindersAtom = Atom(name: '_ReminderStoreBase.reminders');

  @override
  List<ReminderModel> get reminders {
    _$remindersAtom.reportRead();
    return super.reminders;
  }

  @override
  set reminders(List<ReminderModel> value) {
    _$remindersAtom.reportWrite(value, super.reminders, () {
      super.reminders = value;
    });
  }

  final _$getRemindersAsyncAction =
      AsyncAction('_ReminderStoreBase.getReminders');

  @override
  Future<void> getReminders() {
    return _$getRemindersAsyncAction.run(() => super.getReminders());
  }

  @override
  String toString() {
    return '''
reminders: ${reminders}
    ''';
  }
}
