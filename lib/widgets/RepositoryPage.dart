import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import './RepositoryByOwnerPage.dart' show RepositoryByOwnerPage;
import './TrendingRepositoryPage.dart' show TrendingRepositoryPage;
import './TabBarIndicator.dart' show TabBarIndicator, tabBarIndicatorStore;

class RepositoryPage extends StatefulWidget{

  @override
  _RepositoryPageState createState() => _RepositoryPageState();

  const RepositoryPage();
}

class _RepositoryPageState extends State<RepositoryPage> with SingleTickerProviderStateMixin{

  final List<String> tabs = <String>[
    'Repositories',
    'Trending repositories'
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.addListener(() {
      tabBarIndicatorStore.change(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Observer(builder: (_) {
            return Column(
              children: <Widget>[
                Text(tabs.elementAt(tabBarIndicatorStore.index)),
                TabBarIndicator(
                    num: BigInt.from(2)
                )
              ],
            );
          }),
        ),
        body: Center(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              RepositoryByOwnerPage(),
              TrendingRepositoryPage()
            ],
          ),
        ),
      ),
    );
  }

}