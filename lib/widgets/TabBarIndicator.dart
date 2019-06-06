import 'package:flutter/material.dart';

class TabBarIndicator extends StatelessWidget {
  const TabBarIndicator({
    Key key,
    this.num,
    this.index,
  }) : super(key: key);

  final BigInt num;
  final BigInt index;
  final String name = 'TabBarIndicator';

  List<Widget> gen() {
    List<Widget> list = new List();
    for(int i = 0 ; i < num.toInt(); i ++) {
      list.add(SizedBox(
        child: Icon(IconData(i == index.toInt()? 58278: 58747, fontFamily: 'MaterialIcons'), size: i == index.toInt()? 16: 12),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: gen()
      ),
    );
  }
}