// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReminderStore on _ReminderStoreBase, Store {
  Computed<bool> _$isValidNumberComputed;

  @override
  bool get isValidNumber =>
      (_$isValidNumberComputed ??= Computed<bool>(() => super.isValidNumber,
              name: '_ReminderStoreBase.isValidNumber'))
          .value;
  Computed<bool> _$isValidSubjectsComputed;

  @override
  bool get isValidSubjects =>
      (_$isValidSubjectsComputed ??= Computed<bool>(() => super.isValidSubjects,
              name: '_ReminderStoreBase.isValidSubjects'))
          .value;
  Computed<bool> _$isValidDeadlineComputed;

  @override
  bool get isValidDeadline =>
      (_$isValidDeadlineComputed ??= Computed<bool>(() => super.isValidDeadline,
              name: '_ReminderStoreBase.isValidDeadline'))
          .value;
  Computed<String> _$errorNumberComputed;

  @override
  String get errorNumber =>
      (_$errorNumberComputed ??= Computed<String>(() => super.errorNumber,
              name: '_ReminderStoreBase.errorNumber'))
          .value;
  Computed<String> _$errorSubjectsComputed;

  @override
  String get errorSubjects =>
      (_$errorSubjectsComputed ??= Computed<String>(() => super.errorSubjects,
              name: '_ReminderStoreBase.errorSubjects'))
          .value;
  Computed<String> _$errorDeadlineComputed;

  @override
  String get errorDeadline =>
      (_$errorDeadlineComputed ??= Computed<String>(() => super.errorDeadline,
              name: '_ReminderStoreBase.errorDeadline'))
          .value;

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

  final _$numberAtom = Atom(name: '_ReminderStoreBase.number');

  @override
  String get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  final _$subjectsAtom = Atom(name: '_ReminderStoreBase.subjects');

  @override
  String get subjects {
    _$subjectsAtom.reportRead();
    return super.subjects;
  }

  @override
  set subjects(String value) {
    _$subjectsAtom.reportWrite(value, super.subjects, () {
      super.subjects = value;
    });
  }

  final _$deadlineAtom = Atom(name: '_ReminderStoreBase.deadline');

  @override
  String get deadline {
    _$deadlineAtom.reportRead();
    return super.deadline;
  }

  @override
  set deadline(String value) {
    _$deadlineAtom.reportWrite(value, super.deadline, () {
      super.deadline = value;
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

  final _$_ReminderStoreBaseActionController =
      ActionController(name: '_ReminderStoreBase');

  @override
  void setNumber(String value) {
    final _$actionInfo = _$_ReminderStoreBaseActionController.startAction(
        name: '_ReminderStoreBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$_ReminderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSubjects(String value) {
    final _$actionInfo = _$_ReminderStoreBaseActionController.startAction(
        name: '_ReminderStoreBase.setSubjects');
    try {
      return super.setSubjects(value);
    } finally {
      _$_ReminderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reminders: ${reminders},
reminderModel: ${reminderModel},
number: ${number},
subjects: ${subjects},
deadline: ${deadline},
loading: ${loading},
doneIn: ${doneIn},
deleteIn: ${deleteIn},
isValidNumber: ${isValidNumber},
isValidSubjects: ${isValidSubjects},
isValidDeadline: ${isValidDeadline},
errorNumber: ${errorNumber},
errorSubjects: ${errorSubjects},
errorDeadline: ${errorDeadline}
    ''';
  }
}
