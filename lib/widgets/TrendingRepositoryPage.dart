import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../github_trending/fetch.dart' show fetchIncoming, repositoryListViewStore;
import './RespositoryListViewShareDataWidget.dart' show RespositoryListViewShareDataWidget;
import './RepositoryListView.dart' show RepositoryListView;
import './TabBarIndicator.dart' show TabBarIndicator;

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
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              Text('Trending repositories'),
              TabBarIndicator(
                num: BigInt.from(2),
                index: BigInt.from(1),
              )
            ],
          ),
        ),
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
