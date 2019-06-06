import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../service/query/repository.dart' show readRepositories;
import './RepositoryListView.dart' show RepositoryListView;
import './RespositoryListViewShareDataWidget.dart' show RespositoryListViewShareDataWidget;
import './TabBarIndicator.dart' show TabBarIndicator;

class RepositoryByOwnerPage extends StatefulWidget{
  @override
  _RepositoryByOwnerPageState createState() => _RepositoryByOwnerPageState();

  const RepositoryByOwnerPage();
}

class _RepositoryByOwnerPageState extends State<RepositoryByOwnerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              Text('Repositories'),
              TabBarIndicator(
                num: BigInt.from(2),
                index: BigInt.from(0),
              )
            ],
          ),
        ),
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
              return RespositoryListViewShareDataWidget(
                data: repositories,
                child: RepositoryListView(),
              );
            },
          ),
        ),
    );
  }
}
