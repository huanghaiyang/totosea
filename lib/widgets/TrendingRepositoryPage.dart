import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../github_trending/fetch.dart' show fetchIncoming, repositoryListViewStore;
import './RespositoryListViewShareDataWidget.dart' show RespositoryListViewShareDataWidget;
import './RepositoryListView.dart' show RepositoryListView;

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
          title: const Text('Trending Repositories'),
        ),
        body: Observer(
          builder: (_) {
            List<Object> repositories = repositoryListViewStore.repositories;
            return Center(
              child: RespositoryListViewShareDataWidget(
              data: repositories,
              child: RepositoryListView(),
            ),
          );},
        )
    );
  }
}
