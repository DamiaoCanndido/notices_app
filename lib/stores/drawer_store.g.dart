// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DrawerStore on _DrawerStoreBase, Store {
  final _$pageIndexAtom = Atom(name: '_DrawerStoreBase.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  final _$_DrawerStoreBaseActionController =
      ActionController(name: '_DrawerStoreBase');

  @override
  void setPageIndex(int value) {
    final _$actionInfo = _$_DrawerStoreBaseActionController.startAction(
        name: '_DrawerStoreBase.setPageIndex');
    try {
      return super.setPageIndex(value);
    } finally {
      _$_DrawerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex}
    ''';
  }
}
