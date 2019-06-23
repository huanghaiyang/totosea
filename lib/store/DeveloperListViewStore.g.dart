// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeveloperListViewStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$DeveloperListViewStore on _DeveloperListViewStore, Store {
  final _$developersAtom = Atom(name: '_DeveloperListViewStore.developers');

  @override
  List<Object> get developers {
    _$developersAtom.context.enforceReadPolicy(_$developersAtom);
    _$developersAtom.reportObserved();
    return super.developers;
  }

  @override
  set developers(List<Object> value) {
    _$developersAtom.context.enforceWritePolicy(_$developersAtom);
    super.developers = value;
    _$developersAtom.reportChanged();
  }

  final _$developersLengthAtom =
      Atom(name: '_DeveloperListViewStore.developersLength');

  @override
  int get developersLength {
    _$developersLengthAtom.context.enforceReadPolicy(_$developersLengthAtom);
    _$developersLengthAtom.reportObserved();
    return super.developersLength;
  }

  @override
  set developersLength(int value) {
    _$developersLengthAtom.context.enforceWritePolicy(_$developersLengthAtom);
    super.developersLength = value;
    _$developersLengthAtom.reportChanged();
  }

  final _$_DeveloperListViewStoreActionController =
      ActionController(name: '_DeveloperListViewStore');

  @override
  List<Object> concat(List<Object> icomingdevelopers) {
    final _$actionInfo =
        _$_DeveloperListViewStoreActionController.startAction();
    try {
      return super.concat(icomingdevelopers);
    } finally {
      _$_DeveloperListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Object> concatOne(Object icomingdeveloper) {
    final _$actionInfo =
        _$_DeveloperListViewStoreActionController.startAction();
    try {
      return super.concatOne(icomingdeveloper);
    } finally {
      _$_DeveloperListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAll() {
    final _$actionInfo =
        _$_DeveloperListViewStoreActionController.startAction();
    try {
      return super.clearAll();
    } finally {
      _$_DeveloperListViewStoreActionController.endAction(_$actionInfo);
    }
  }
}
