import 'package:mobx/mobx.dart';

// Include generated file
part 'TopicsListViewStore.g.dart';

// This is the class used by rest of your codebase
class TopicsListViewStore = _TopicsListViewStore with _$TopicsListViewStore;

// The store-class
abstract class _TopicsListViewStore with Store {

  @observable
  List<Object> topics = [];
  
  @observable
  int topicsLength = 0;
  
  @action
  List<Object> concat(List<Object> icomingTopics) {
    if(icomingTopics != null && icomingTopics.length != 0) {
      topics.addAll(icomingTopics);
      topicsLength += icomingTopics.length;
    }
    return topics;
  }
  
  @action
  List<Object> concatOne(Object icomingdeveloper) {
    if(icomingdeveloper != null) {
      topics.add(icomingdeveloper);
      topicsLength ++;
    }
    return topics;
  }
  
  @action
  void clearAll() {
    topicsLength = 0;
    topics.clear();
  }

}