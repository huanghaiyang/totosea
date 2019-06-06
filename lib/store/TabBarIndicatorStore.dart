import 'package:mobx/mobx.dart';

part 'TabBarIndicatorStore.g.dart';

class TabBarIndicatorStore = _TabBarIndicatorStore with _$TabBarIndicatorStore;

abstract class _TabBarIndicatorStore with Store {

  @observable
  int index = 0;

  @action
  int change(int _index) {
    index = _index;
    return index;
  }

}