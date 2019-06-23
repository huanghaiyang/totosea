// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TabBarIndicatorStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$TabBarIndicatorStore on _TabBarIndicatorStore, Store {
  final _$indexAtom = Atom(name: '_TabBarIndicatorStore.index');

  @override
  int get index {
    _$indexAtom.context.enforceReadPolicy(_$indexAtom);
    _$indexAtom.reportObserved();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.context.enforceWritePolicy(_$indexAtom);
    super.index = value;
    _$indexAtom.reportChanged();
  }

  final _$_TabBarIndicatorStoreActionController =
      ActionController(name: '_TabBarIndicatorStore');

  @override
  int change(int _index) {
    final _$actionInfo = _$_TabBarIndicatorStoreActionController.startAction();
    try {
      return super.change(_index);
    } finally {
      _$_TabBarIndicatorStoreActionController.endAction(_$actionInfo);
    }
  }
}
