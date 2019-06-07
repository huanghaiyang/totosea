import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:totosea/service/query/repository.dart' show readRepositories;
import 'package:totosea/widgets/listView/RepositoryListView.dart' show RepositoryListView;
import 'package:totosea/widgets/share/RepositoryListViewShareDataWidget.dart'
    show RepositoryListViewShareDataWidget;

class RepositoryByOwnerPage extends StatefulWidget{
  @override
  _RepositoryByOwnerPageState createState() => _RepositoryByOwnerPageState();

  const RepositoryByOwnerPage();
}

class _RepositoryByOwnerPageState extends State<RepositoryByOwnerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Query(
            options: QueryOptions(
              document: readRepositories, // this is the query string you just created
              variables: {
                'nRepositories': 10,
              },
              pollInterval: 10,
            ),
            // Just like in apollo refetch() could be used to manually trigger a refetch
            builder: (QueryResult result, { VoidCallback refetch }) {
              if (result.errors != null) {
                return Text(result.errors.toString());
              }

              if (result.loading) {
                return Text('Loading');
              }

              // it can be either Map or List
              List<Object> repositories = result.data['viewer']['repositories']['nodes'];
              return Column(
                children: <Widget>[
                  Container(
                      height: 30,
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Row(
                        children: <Widget>[
                          Text(
                              'All ' + repositories.length.toString() + ' repositories',
                              style: TextStyle(fontStyle: FontStyle.italic)
                          ),
                        ],
                      )
                  ),
                  Expanded(
                    child: RepositoryListViewShareDataWidget(
                      data: repositories,
                      child: RepositoryListView(),
                    ),
                  )
                ],
              );
            },
          ),
        ),
    );
  }
}
