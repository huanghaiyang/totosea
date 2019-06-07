import 'package:flutter/material.dart';

class TopicsListViewShareDataWidget extends InheritedWidget {
  TopicsListViewShareDataWidget({
    @required this.data,
    Widget child
  }) :super(child: child);

  List<Object> data;

  static TopicsListViewShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(TopicsListViewShareDataWidget);
  }

  @override
  bool updateShouldNotify(TopicsListViewShareDataWidget old) {
    return old.data != data;
  }
}