import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../service/query/repository.dart' show readRepositories;
import './RepositoryListView.dart' show RepositoryListView;
import './ShareDataWidget.dart' show ShareDataWidget;

class RepositoryPage extends StatefulWidget{
  @override
  _RepositoryPageState createState() => _RepositoryPageState();

  const RepositoryPage();
}

class _RepositoryPageState extends State<RepositoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Repositories'),
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
              return ShareDataWidget(
                data: repositories,
                child: RepositoryListView(),
              );
            },
          ),
        ),
    );
  }
}
