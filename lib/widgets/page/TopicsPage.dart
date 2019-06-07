import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:totosea/github_trending/fetch.dart' show fetchIncomingTopics, topicsListViewStore;
import 'package:totosea/widgets/share/TopicsListViewShareDataWidget.dart'
    show TopicsListViewShareDataWidget;
import 'package:totosea/widgets/listView/TopicsListView.dart' show TopicsListView;

class TopicsPage extends StatefulWidget{
  @override
  _TopicsPageState createState() => _TopicsPageState();

  const TopicsPage();
}

class _TopicsPageState extends State<TopicsPage> {

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    fetchIncomingTopics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Observer(
          builder: (_) {
            int topicsLength = topicsListViewStore.topicsLength;
            List<Object> topics = topicsListViewStore.topics;
            return Column(
              children: <Widget>[
                Container(
                  height: 30,
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'All ' + topicsLength.toString() + ' topics',
                        style: TextStyle(fontStyle: FontStyle.italic)
                      ),
                    ],
                  )
                ),
                Expanded(
                  child: TopicsListViewShareDataWidget(
                    data: topics,
                    child: TopicsListView(),
                  ),
                )
              ],
            );
          },
        )
    );
  }
}
