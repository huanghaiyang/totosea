import 'package:flutter/material.dart';
import 'package:totosea/widgets/iconfont.dart';

import 'package:totosea/lodash/index.dart' as _;
import 'package:totosea/utils/color.dart' show hexToColor;
import 'package:totosea/widgets/share/DeveloperListViewShareDataWidget.dart'
    show DeveloperListViewShareDataWidget;

class DeveloperListView extends StatefulWidget{
  @override
  _DeveloperListViewState createState() => _DeveloperListViewState();

  const DeveloperListView({
    Key key
  }): super(key: key);
}

class _DeveloperListViewState extends State<DeveloperListView> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<Object> developers = DeveloperListViewShareDataWidget.of(context).data;
    return ListView.builder(
        itemCount: developers.length,
        itemBuilder: (context, index) {
          final developer = Map.from(developers[index]);
          return new Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.1, color: Colors.black54),
              ),
            ),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              ],
            ),
          );
        });
  }

}