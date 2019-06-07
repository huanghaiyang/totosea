// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TopicsListViewStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$TopicsListViewStore on _TopicsListViewStore, Store {
  final _$topicsAtom = Atom(name: '_TopicsListViewStore.topics');

  @override
  List<Object> get topics {
    _$topicsAtom.reportObserved();
    return super.topics;
  }

  @override
  set topics(List<Object> value) {
    _$topicsAtom.context.checkIfStateModificationsAreAllowed(_$topicsAtom);
    super.topics = value;
    _$topicsAtom.reportChanged();
  }

  final _$topicsLengthAtom = Atom(name: '_TopicsListViewStore.topicsLength');

  @override
  int get topicsLength {
    _$topicsLengthAtom.reportObserved();
    return super.topicsLength;
  }

  @override
  set topicsLength(int value) {
    _$topicsLengthAtom.context
        .checkIfStateModificationsAreAllowed(_$topicsLengthAtom);
    super.topicsLength = value;
    _$topicsLengthAtom.reportChanged();
  }

  final _$_TopicsListViewStoreActionController =
      ActionController(name: '_TopicsListViewStore');

  @override
  List<Object> concat(List<Object> icomingTopics) {
    final _$actionInfo = _$_TopicsListViewStoreActionController.startAction();
    try {
      return super.concat(icomingTopics);
    } finally {
      _$_TopicsListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Object> concatOne(Object icomingdeveloper) {
    final _$actionInfo = _$_TopicsListViewStoreActionController.startAction();
    try {
      return super.concatOne(icomingdeveloper);
    } finally {
      _$_TopicsListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAll() {
    final _$actionInfo = _$_TopicsListViewStoreActionController.startAction();
    try {
      return super.clearAll();
    } finally {
      _$_TopicsListViewStoreActionController.endAction(_$actionInfo);
    }
  }
}
