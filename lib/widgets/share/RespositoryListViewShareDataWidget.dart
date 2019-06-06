import 'package:flutter/material.dart';

class RespositoryListViewShareDataWidget extends InheritedWidget {
  RespositoryListViewShareDataWidget({
    @required this.data,
    Widget child
  }) :super(child: child);

  List<Object> data;

  static RespositoryListViewShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(RespositoryListViewShareDataWidget);
  }

  @override
  bool updateShouldNotify(RespositoryListViewShareDataWidget old) {
    return old.data != data;
  }
}