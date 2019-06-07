import 'package:flutter/material.dart';

class RepositoryListViewShareDataWidget extends InheritedWidget {
  RepositoryListViewShareDataWidget({
    @required this.data,
    Widget child
  }) :super(child: child);

  List<Object> data;

  static RepositoryListViewShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(RepositoryListViewShareDataWidget);
  }

  @override
  bool updateShouldNotify(RepositoryListViewShareDataWidget old) {
    return old.data != data;
  }
}