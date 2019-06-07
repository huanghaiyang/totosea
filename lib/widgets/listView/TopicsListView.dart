import 'package:flutter/material.dart';
import 'package:totosea/widgets/iconfont.dart';

import 'package:totosea/lodash/index.dart' as _;
import 'package:totosea/utils/color.dart' show hexToColor;
import 'package:totosea/widgets/share/TopicsListViewShareDataWidget.dart'
    show TopicsListViewShareDataWidget;

class TopicsListView extends StatefulWidget{
  @override
  _TopicsListViewState createState() => _TopicsListViewState();

  const TopicsListView({
      Key key
  }): super(key: key);
}

class _TopicsListViewState extends State<TopicsListView> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<Object> topics = TopicsListViewShareDataWidget.of(context).data;
    return ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = Map.from(topics[index]);
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
                Expanded(
                  child: _.get(topic, 'avatarUrl', null) != null ? Container(
                      width: 30.0,
                      height: 30.0,
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              topic['avatarUrl']
                          ),
                        ),
                      )
                  ): Container(
                    child: Icon(IconData(57676, fontFamily: 'MaterialIcons'), color: Colors.deepOrangeAccent,),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Text(_.get(topic, 'name', ''), style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Text(_.get(topic, 'description', '')),
                      )
                    ],
                  ),
                  flex: 10,
                )
              ],
            ),
          );
        });
  }

}