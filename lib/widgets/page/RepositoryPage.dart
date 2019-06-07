import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:totosea/widgets/page/RepositoryByOwnerPage.dart' show RepositoryByOwnerPage;
import 'package:totosea/widgets/page/TrendingRepositoryPage.dart' show TrendingRepositoryPage;
import 'package:totosea/widgets/page/TrendingDeveloperPage.dart' show TrendingDeveloperPage;
import 'package:totosea/widgets/page/TopicsPage.dart' show TopicsPage;
import 'package:totosea/widgets/common/TabBarIndicator.dart' show TabBarIndicator, tabBarIndicatorStore;

class RepositoryPage extends StatefulWidget{

  @override
  _RepositoryPageState createState() => _RepositoryPageState();

  const RepositoryPage();
}

class _RepositoryPageState extends State<RepositoryPage> with SingleTickerProviderStateMixin{

  final List<String> tabs = <String>[
    'Repositories',
    'Trending repositories',
    'Trending developers',
    'Topics'
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
                    num: BigInt.from(4)
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
              TrendingRepositoryPage(),
              TrendingDeveloperPage(),
              TopicsPage()
            ],
          ),
        ),
      ),
    );
  }

}