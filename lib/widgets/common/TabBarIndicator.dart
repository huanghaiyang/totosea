import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:totosea/store/TabBarIndicatorStore.dart' show TabBarIndicatorStore;

final tabBarIndicatorStore = TabBarIndicatorStore();

class TabBarIndicator extends StatefulWidget{

  @override
  _TabBarIndicatorState createState() => _TabBarIndicatorState();

  const TabBarIndicator({
    Key key,
    this.num,
  }) : super(key: key);

  final BigInt num;
}

class _TabBarIndicatorState extends State<TabBarIndicator> {

  List<Widget> gen(int index) {
    List<Widget> list = new List();
    for(int i = 0 ; i < widget.num.toInt(); i ++) {
      list.add(SizedBox(
        child: Icon(IconData(i == index? 58278: 58747, fontFamily: 'MaterialIcons'), size: i == index.toInt()? 16: 12),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Observer(
        builder: (_) {
          int index = tabBarIndicatorStore.index;
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: gen(index)
          );
        },
      ),
    );
  }
}