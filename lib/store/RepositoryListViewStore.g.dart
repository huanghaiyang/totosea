// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RepositoryListViewStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$RepositoryListViewStore on _RepositoryListViewStore, Store {
  final _$repositoriesAtom =
      Atom(name: '_RepositoryListViewStore.repositories');

  @override
  List<Object> get repositories {
    _$repositoriesAtom.context.enforceReadPolicy(_$repositoriesAtom);
    _$repositoriesAtom.reportObserved();
    return super.repositories;
  }

  @override
  set repositories(List<Object> value) {
    _$repositoriesAtom.context.enforceWritePolicy(_$repositoriesAtom);
    super.repositories = value;
    _$repositoriesAtom.reportChanged();
  }

  final _$repositoriesLengthAtom =
      Atom(name: '_RepositoryListViewStore.repositoriesLength');

  @override
  int get repositoriesLength {
    _$repositoriesLengthAtom.context
        .enforceReadPolicy(_$repositoriesLengthAtom);
    _$repositoriesLengthAtom.reportObserved();
    return super.repositoriesLength;
  }

  @override
  set repositoriesLength(int value) {
    _$repositoriesLengthAtom.context
        .enforceWritePolicy(_$repositoriesLengthAtom);
    super.repositoriesLength = value;
    _$repositoriesLengthAtom.reportChanged();
  }

  final _$_RepositoryListViewStoreActionController =
      ActionController(name: '_RepositoryListViewStore');

  @override
  List<Object> concat(List<Object> icomingRepositories) {
    final _$actionInfo =
        _$_RepositoryListViewStoreActionController.startAction();
    try {
      return super.concat(icomingRepositories);
    } finally {
      _$_RepositoryListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Object> concatOne(Object icomingRepository) {
    final _$actionInfo =
        _$_RepositoryListViewStoreActionController.startAction();
    try {
      return super.concatOne(icomingRepository);
    } finally {
      _$_RepositoryListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAll() {
    final _$actionInfo =
        _$_RepositoryListViewStoreActionController.startAction();
    try {
      return super.clearAll();
    } finally {
      _$_RepositoryListViewStoreActionController.endAction(_$actionInfo);
    }
  }
}
