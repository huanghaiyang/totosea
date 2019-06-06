import 'package:flutter/material.dart';

import './RepositoryByOwnerPage.dart' show RepositoryByOwnerPage;
import './TrendingRepositoryPage.dart' show TrendingRepositoryPage;

class RepositoryPage extends StatefulWidget{

  @override
  _RepositoryPageState createState() => _RepositoryPageState();

  const RepositoryPage();
}

class _RepositoryPageState extends State<RepositoryPage> with SingleTickerProviderStateMixin{

  final List<Tab> tabs = <Tab>[
    Tab(text: 'Repositories'),
    Tab(text: 'TrendingRepositories'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
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
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          RepositoryByOwnerPage(),
          TrendingRepositoryPage()
        ],
      ),
    );
  }

}