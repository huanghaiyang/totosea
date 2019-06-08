import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:totosea/lodash/index.dart' as _;
import 'package:totosea/service/action/repositoryFetch.dart' show repositoryDetailCollectionsStore, fetchRepository;

class RepositoryDetailPage extends StatefulWidget{
  @override
  _RepositoryDetailPageState createState() => _RepositoryDetailPageState();

  const RepositoryDetailPage();
}

class _RepositoryDetailPageState extends State<RepositoryDetailPage> {

  String id;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map params = ModalRoute.of(context).settings.arguments;
    id = params['id'];
    fetchRepository(params);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (buildContext) {
        Map repository = repositoryDetailCollectionsStore.repositoriesMap[id];
        return Scaffold(
            appBar: AppBar(
              title: Text("Repository"),
            ),
            body: Center(
              child: repository == null ? Container() : Column(
                children: <Widget>[
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: 30.0,
                              height: 30.0,
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(3.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      repository['owner']['avatarUrl']
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                            flex: 8,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Align(
                                    child: new Text(repository['owner']['login'] + ' / ' + repository['name'], style: new TextStyle(fontSize: 14, color: Colors.blueAccent)),
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                  child: Align(
                                    child: new Text(repository['description']),
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                  child: Align(
                                    child: new Text('Last update time ' + repository['updatedAt']),
                                    alignment: Alignment.centerLeft,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Text(_.get(repository, 'watchers.totolCount', '0').toString()),
                                Text('Watchers')
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Text(_.get(repository, 'stargazers.totolCount', '0').toString()),
                                Text('Stars')
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Text(_.get(repository, 'forkCount', '0').toString()),
                                Text('Forks')
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Text(_.get(repository, 'releases.totolCount', '0').toString()),
                                Text('Releases')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
        );
      },
    );
  }

}