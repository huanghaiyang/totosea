import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:totosea/github_fetch/fetch.dart' show fetchIncomingDevelopers, developerListViewStore;
import 'package:totosea/widgets/share/DeveloperListViewShareDataWidget.dart'
    show DeveloperListViewShareDataWidget;
import 'package:totosea/widgets/listView/DeveloperListView.dart' show DeveloperListView;

class TrendingDeveloperPage extends StatefulWidget{
  @override
  _TrendingDeveloperPageState createState() => _TrendingDeveloperPageState();

  const TrendingDeveloperPage();
}

class _TrendingDeveloperPageState extends State<TrendingDeveloperPage> {

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    fetchIncomingDevelopers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Observer(
          builder: (_) {
            int developersLength = developerListViewStore.developersLength;
            List<Object> developers = developerListViewStore.developers;
            return Column(
              children: <Widget>[
                Container(
                    height: 30,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                            'All ' + developersLength.toString() + ' Developers',
                            style: TextStyle(fontStyle: FontStyle.italic)
                        ),
                      ],
                    )
                ),
                Expanded(
                  child: DeveloperListViewShareDataWidget(
                    data: developers,
                    child: DeveloperListView(),
                  ),
                )
              ],
            );
          },
        )
    );
  }
}
