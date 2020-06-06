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

  final _$loadingAtom = Atom(name: '_ReminderStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$doneInAtom = Atom(name: '_ReminderStoreBase.doneIn');

  @override
  bool get doneIn {
    _$doneInAtom.reportRead();
    return super.doneIn;
  }

  @override
  set doneIn(bool value) {
    _$doneInAtom.reportWrite(value, super.doneIn, () {
      super.doneIn = value;
    });
  }

  final _$deleteInAtom = Atom(name: '_ReminderStoreBase.deleteIn');

  @override
  bool get deleteIn {
    _$deleteInAtom.reportRead();
    return super.deleteIn;
  }

  @override
  set deleteIn(bool value) {
    _$deleteInAtom.reportWrite(value, super.deleteIn, () {
      super.deleteIn = value;
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

  final _$deleteReminderAsyncAction =
      AsyncAction('_ReminderStoreBase.deleteReminder');

  @override
  Future<void> deleteReminder(ReminderModel reminder) {
    return _$deleteReminderAsyncAction
        .run(() => super.deleteReminder(reminder));
  }

  @override
  String toString() {
    return '''
reminders: ${reminders},
reminderModel: ${reminderModel},
loading: ${loading},
doneIn: ${doneIn},
deleteIn: ${deleteIn}
    ''';
  }
}
