// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NoticeStore on _NoticeStoreBase, Store {
  Computed<bool> _$isSubjectsValidComputed;

  @override
  bool get isSubjectsValid =>
      (_$isSubjectsValidComputed ??= Computed<bool>(() => super.isSubjectsValid,
              name: '_NoticeStoreBase.isSubjectsValid'))
          .value;
  Computed<String> _$errorSubjectsComputed;

  @override
  String get errorSubjects =>
      (_$errorSubjectsComputed ??= Computed<String>(() => super.errorSubjects,
              name: '_NoticeStoreBase.errorSubjects'))
          .value;
  Computed<Function> _$subjectPressedComputed;

  @override
  Function get subjectPressed => (_$subjectPressedComputed ??=
          Computed<Function>(() => super.subjectPressed,
              name: '_NoticeStoreBase.subjectPressed'))
      .value;
  Computed<Function> _$subjectPressedEditComputed;

  @override
  Function get subjectPressedEdit => (_$subjectPressedEditComputed ??=
          Computed<Function>(() => super.subjectPressedEdit,
              name: '_NoticeStoreBase.subjectPressedEdit'))
      .value;

  final _$subjectsAtom = Atom(name: '_NoticeStoreBase.subjects');

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

  final _$createdInAtom = Atom(name: '_NoticeStoreBase.createdIn');

  @override
  bool get createdIn {
    _$createdInAtom.reportRead();
    return super.createdIn;
  }

  @override
  set createdIn(bool value) {
    _$createdInAtom.reportWrite(value, super.createdIn, () {
      super.createdIn = value;
    });
  }

  final _$loadingAtom = Atom(name: '_NoticeStoreBase.loading');

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

  final _$msgErrorAtom = Atom(name: '_NoticeStoreBase.msgError');

  @override
  bool get msgError {
    _$msgErrorAtom.reportRead();
    return super.msgError;
  }

  @override
  set msgError(bool value) {
    _$msgErrorAtom.reportWrite(value, super.msgError, () {
      super.msgError = value;
    });
  }

  final _$noticesAtom = Atom(name: '_NoticeStoreBase.notices');

  @override
  List<NoticeModel> get notices {
    _$noticesAtom.reportRead();
    return super.notices;
  }

  @override
  set notices(List<NoticeModel> value) {
    _$noticesAtom.reportWrite(value, super.notices, () {
      super.notices = value;
    });
  }

  final _$noticeAtom = Atom(name: '_NoticeStoreBase.notice');

  @override
  ApiResponse<NoticeModel> get notice {
    _$noticeAtom.reportRead();
    return super.notice;
  }

  @override
  set notice(ApiResponse<NoticeModel> value) {
    _$noticeAtom.reportWrite(value, super.notice, () {
      super.notice = value;
    });
  }

  final _$editNoticeAtom = Atom(name: '_NoticeStoreBase.editNotice');

  @override
  NoticeModel get editNotice {
    _$editNoticeAtom.reportRead();
    return super.editNotice;
  }

  @override
  set editNotice(NoticeModel value) {
    _$editNoticeAtom.reportWrite(value, super.editNotice, () {
      super.editNotice = value;
    });
  }

  final _$getNoticeAsyncAction = AsyncAction('_NoticeStoreBase.getNotice');

  @override
  Future<void> getNotice() {
    return _$getNoticeAsyncAction.run(() => super.getNotice());
  }

  final _$createNoticeAsyncAction =
      AsyncAction('_NoticeStoreBase.createNotice');

  @override
  Future<void> createNotice() {
    return _$createNoticeAsyncAction.run(() => super.createNotice());
  }

  final _$updateNoticeAsyncAction =
      AsyncAction('_NoticeStoreBase.updateNotice');

  @override
  Future<void> updateNotice() {
    return _$updateNoticeAsyncAction.run(() => super.updateNotice());
  }

  final _$deleteNoticeAsyncAction =
      AsyncAction('_NoticeStoreBase.deleteNotice');

  @override
  Future<void> deleteNotice(NoticeModel notice) {
    return _$deleteNoticeAsyncAction.run(() => super.deleteNotice(notice));
  }

  final _$_NoticeStoreBaseActionController =
      ActionController(name: '_NoticeStoreBase');

  @override
  void setSubjects(String value) {
    final _$actionInfo = _$_NoticeStoreBaseActionController.startAction(
        name: '_NoticeStoreBase.setSubjects');
    try {
      return super.setSubjects(value);
    } finally {
      _$_NoticeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subjects: ${subjects},
createdIn: ${createdIn},
loading: ${loading},
msgError: ${msgError},
notices: ${notices},
notice: ${notice},
editNotice: ${editNotice},
isSubjectsValid: ${isSubjectsValid},
errorSubjects: ${errorSubjects},
subjectPressed: ${subjectPressed},
subjectPressedEdit: ${subjectPressedEdit}
    ''';
  }
}
