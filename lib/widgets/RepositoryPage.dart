import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../service/query/repository.dart' show readRepositories;
import '../utils/color.dart' show hexToColor;

class RepositoryPage extends StatefulWidget{
  RepositoryPage({Key key}) : super(key: key);
  @override
  _RepositoryPageState createState() => _RepositoryPageState();
}

class _RepositoryPageState extends State<RepositoryPage> {

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: readRepositories, // this is the query string you just created
        variables: {
          'nRepositories': 1,
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
        List repositories = result.data['viewer']['repositories']['nodes'];
        return ListView.builder(
          itemCount: repositories.length,
          itemBuilder: (context, index) {
            final repository = repositories[index];
            return new Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(2.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            repository['owner']['avatarUrl']
                        ),
                      ),
                    )
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Align(
                        child: new Text(repository['owner']['login'] + '/' + repository['name'], style: new TextStyle(fontSize: 12)),
                        alignment: Alignment.centerLeft,
                      ),
                      Align(
                        child: new Text(repository['description']),
                        alignment: Alignment.centerLeft,
                      ),
                      Align(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Icon(IconData(0xe3a6, fontFamily: 'MaterialIcons'), color: hexToColor(repository['languages']['nodes'][0]['color']), size: 12,),
                                  Text(repository['languages']['nodes'][0]['name'])
                                ],
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Text(repository['forkCount'].toString())
                                ],
                              ),
                              flex: 1,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  flex: 10,
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.contain, // otherwise the logo will be tiny
                    child: const FlutterLogo(),
                  ),
                  flex: 2,
                ),
              ],
            );
        });
      },
    );
  }
}
