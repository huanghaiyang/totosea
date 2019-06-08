import 'package:mobx/mobx.dart';

// Include generated file
part 'RepositoryDetailCollectionsStore.g.dart';

// This is the class used by rest of your codebase
class RepositoryDetailCollectionsStore = _RepositoryDetailCollectionsStore with _$RepositoryDetailCollectionsStore;

// The store-class
abstract class _RepositoryDetailCollectionsStore with Store {

  @observable
  Map<String, Map> repositoriesMap = new Map();

  @observable
  int size = 0;

  @action
  Map<String, Map> add(String id, Map map) {
    if(map != null) {
      repositoriesMap[id] = map;
      size ++;
    }
    return repositoriesMap;
  }

  @action
  void clear() {
    repositoriesMap.clear();
    size =0;
  }

}