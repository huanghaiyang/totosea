import 'package:flutter/material.dart';

class DeveloperListViewShareDataWidget extends InheritedWidget {
  DeveloperListViewShareDataWidget({
    @required this.data,
    Widget child
  }) :super(child: child);

  List<Object> data;

  static DeveloperListViewShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(DeveloperListViewShareDataWidget);
  }

  @override
  bool updateShouldNotify(DeveloperListViewShareDataWidget old) {
    return old.data != data;
  }
}