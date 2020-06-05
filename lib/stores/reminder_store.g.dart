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

  final _$reminderModelAtom = Atom(name: '_ReminderStoreBase.reminderModel');

  @override
  ApiResponse<ReminderModel> get reminderModel {
    _$reminderModelAtom.reportRead();
    return super.reminderModel;
  }

  @override
  set reminderModel(ApiResponse<ReminderModel> value) {
    _$reminderModelAtom.reportWrite(value, super.reminderModel, () {
      super.reminderModel = value;
    });
  }

  final _$getRemindersAsyncAction =
      AsyncAction('_ReminderStoreBase.getReminders');

  @override
  Future<void> getReminders() {
    return _$getRemindersAsyncAction.run(() => super.getReminders());
  }

  final _$doneRemindersAsyncAction =
      AsyncAction('_ReminderStoreBase.doneReminders');

  @override
  Future<void> doneReminders(ReminderModel reminder) {
    return _$doneRemindersAsyncAction.run(() => super.doneReminders(reminder));
  }

  @override
  String toString() {
    return '''
reminders: ${reminders},
reminderModel: ${reminderModel}
    ''';
  }
}