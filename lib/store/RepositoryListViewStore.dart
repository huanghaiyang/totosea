import 'package:mobx/mobx.dart';

// Include generated file
part 'RepositoryListViewStore.g.dart';

// This is the class used by rest of your codebase
class RepositoryListViewStore = _RepositoryListViewStore with _$RepositoryListViewStore;

// The store-class
abstract class _RepositoryListViewStore with Store {

  @observable
  List<Object> repositories = [];

  // 如果不加入这个变量，observable无法感知repositories的变化，我不知道为什么。。。
  @observable
  int repositoriesLength = 0;

  @action
  List<Object> concat(List<Object> icomingRepositories) {
    if(icomingRepositories != null && icomingRepositories.length != 0) {
      repositories.addAll(icomingRepositories);
      repositoriesLength += icomingRepositories.length;
    }
    return repositories;
  }

  @action
  List<Object> concatOne(Object icomingRepository) {
    if(icomingRepository != null) {
      repositories.add(icomingRepository);
      repositoriesLength ++;
    }
    return repositories;
  }

  @action
  void clearAll() {
    repositoriesLength = 0;
    repositories.clear();
  }

}