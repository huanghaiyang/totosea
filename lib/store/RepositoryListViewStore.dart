import 'package:mobx/mobx.dart';

// Include generated file
part 'RepositoryListViewStore.g.dart';

// This is the class used by rest of your codebase
class RepositoryListViewStore = _RepositoryListViewStore with _$RepositoryListViewStore;

// The store-class
abstract class _RepositoryListViewStore with Store {

  @observable
  List<Object> repositories = [];

  @action
  List<Object> concat(List<Object> icomingRepositories) {
    if(icomingRepositories != null && icomingRepositories.length != 0) {
      repositories.addAll(icomingRepositories);
    }
    return repositories;
  }

  @action
  List<Object> concatOne(Object icomingRepository) {
    if(icomingRepository != null) {
      repositories.add(icomingRepository);
    }
    return repositories;
  }

  @action
  void clearAll() {
    repositories.clear();
  }

}