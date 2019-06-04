import 'package:flutter/material.dart';

import '../github_trending/fetch.dart' show fetchTrendingRepo, transformQueryResult;
import './RespositoryListViewShareDataWidget.dart' show RespositoryListViewShareDataWidget;
import './RepositoryListView.dart' show RepositoryListView;

class TrendingRepositoryPage extends StatefulWidget{
  @override
  _TrendingRepositoryPageState createState() => _TrendingRepositoryPageState();

  const TrendingRepositoryPage();
}

class _TrendingRepositoryPageState extends State<TrendingRepositoryPage> {

  List<Map> repositories = new List();

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    List<Object> list = await transformQueryResult(fetchTrendingRepo(), 'repository');
    this.setState(() {
      repositories = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trending Repositories'),
        ),
        body: Center(
          child: RespositoryListViewShareDataWidget(
            data: repositories,
            child: RepositoryListView(),
          ),
        ),
    );
  }
}
