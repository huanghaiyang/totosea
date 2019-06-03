import 'package:flutter/material.dart';
import 'iconfont.dart';

import '../utils/color.dart' show hexToColor;
import '../github_trending/fetch.dart' show fetchTrendingRepo, transformQueryResult;

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
    List<Map> list = await transformQueryResult(fetchTrendingRepo(), 'repository');
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
          child: ListView.builder(
              itemCount: repositories.length,
              itemBuilder: (context, index) {
                final repository = repositories[index];
                final languages = List.castFrom(repository['languages']['nodes']);
                Map language = languages.isEmpty? {}: languages.first;
                return new Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 0.1, color: Colors.black54),
                    ),
                  ),
                  child: new Row(
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
                        flex: 1,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 26,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Align(
                                child: new Text(repository['owner']['login'] + ' / ' + repository['name'], style: new TextStyle(fontSize: 14, color: Colors.blueAccent)),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Align(
                                child: new Text(repository['description']),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              height: 26,
                              child: Align(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            child: Icon(IconData(0xe3a6, fontFamily: 'MaterialIcons'), color: hexToColor(language != null ? language['color']: ""), size: 12),
                                          ),
                                          Text(language['name'] != null? language['name']: "-/-")
                                        ],
                                      ),
                                      flex: 4,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            child: Icon(IconData(0xe885, fontFamily: 'MaterialIcons'), color: Colors.black, size: 12),
                                          ),
                                          Text(repository['stargazers']['totalCount'].toString())
                                        ],
                                      ),
                                      flex: 4,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Icon(IconFont.fork, color: Colors.black, size: 12),
                                          ),
                                          Text(repository['forkCount'].toString())
                                        ],
                                      ),
                                      flex: 4,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            child: Icon(IconData(58835, fontFamily: 'MaterialIcons'), color: Colors.black45, size: 16),
                                          ),
                                        ],
                                      ),
                                      flex: 1,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        flex: 10,
                      )
                    ],
                  ),
                );
              }),
        ),
    );
  }
}
