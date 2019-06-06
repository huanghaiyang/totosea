import 'package:mobx/mobx.dart';

// Include generated file
part 'DeveloperListViewStore.g.dart';

// This is the class used by rest of your codebase
class DeveloperListViewStore = _DeveloperListViewStore with _$DeveloperListViewStore;

// The store-class
abstract class _DeveloperListViewStore with Store {

  @observable
  List<Object> developers = [];
  
  @observable
  int developersLength = 0;
  
  @action
  List<Object> concat(List<Object> icomingdevelopers) {
    if(icomingdevelopers != null && icomingdevelopers.length != 0) {
      developers.addAll(icomingdevelopers);
      developersLength += icomingdevelopers.length;
    }
    return developers;
  }

  @action
  List<Object> concatOne(Object icomingdeveloper) {
    if(icomingdeveloper != null) {
      developers.add(icomingdeveloper);
      developersLength ++;
    }
    return developers;
  }

  @action
  void clearAll() {
    developersLength = 0;
    developers.clear();
  }

}