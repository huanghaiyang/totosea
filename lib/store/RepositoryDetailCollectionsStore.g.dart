// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RepositoryDetailCollectionsStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$RepositoryDetailCollectionsStore
    on _RepositoryDetailCollectionsStore, Store {
  final _$repositoriesMapAtom =
      Atom(name: '_RepositoryDetailCollectionsStore.repositoriesMap');

  @override
  Map<String, Map> get repositoriesMap {
    _$repositoriesMapAtom.reportObserved();
    return super.repositoriesMap;
  }

  @override
  set repositoriesMap(Map<String, Map> value) {
    _$repositoriesMapAtom.context
        .checkIfStateModificationsAreAllowed(_$repositoriesMapAtom);
    super.repositoriesMap = value;
    _$repositoriesMapAtom.reportChanged();
  }

  final _$sizeAtom = Atom(name: '_RepositoryDetailCollectionsStore.size');

  @override
  int get size {
    _$sizeAtom.reportObserved();
    return super.size;
  }

  @override
  set size(int value) {
    _$sizeAtom.context.checkIfStateModificationsAreAllowed(_$sizeAtom);
    super.size = value;
    _$sizeAtom.reportChanged();
  }

  final _$_RepositoryDetailCollectionsStoreActionController =
      ActionController(name: '_RepositoryDetailCollectionsStore');

  @override
  Map<String, Map> add(String id, Map map) {
    final _$actionInfo =
        _$_RepositoryDetailCollectionsStoreActionController.startAction();
    try {
      return super.add(id, map);
    } finally {
      _$_RepositoryDetailCollectionsStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_RepositoryDetailCollectionsStoreActionController.startAction();
    try {
      return super.clear();
    } finally {
      _$_RepositoryDetailCollectionsStoreActionController
          .endAction(_$actionInfo);
    }
  }
}
