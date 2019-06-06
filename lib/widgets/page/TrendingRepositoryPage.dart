import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:totosea/github_trending/fetch.dart' show fetchIncoming, repositoryListViewStore;
import 'package:totosea/widgets/share/RespositoryListViewShareDataWidget.dart' show RespositoryListViewShareDataWidget;
import 'package:totosea/widgets/listView/RepositoryListView.dart' show RepositoryListView;

class TrendingRepositoryPage extends StatefulWidget{
  @override
  _TrendingRepositoryPageState createState() => _TrendingRepositoryPageState();

  const TrendingRepositoryPage();
}

class _TrendingRepositoryPageState extends State<TrendingRepositoryPage> {

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    fetchIncoming();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Observer(
          builder: (_) {
            int repositoriesLength = repositoryListViewStore.repositoriesLength;
            List<Object> repositories = repositoryListViewStore.repositories;
            return Column(
              children: <Widget>[
                Container(
                  height: 30,
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'All ' + repositoriesLength.toString() + ' repositories',
                        style: TextStyle(fontStyle: FontStyle.italic)
                      ),
                    ],
                  )
                ),
                Expanded(
                  child: RespositoryListViewShareDataWidget(
                    data: repositories,
                    child: RepositoryListView(),
                  ),
                )
              ],
            );
          },
        )
    );
  }
}
