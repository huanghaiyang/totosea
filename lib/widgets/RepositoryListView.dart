import 'package:flutter/material.dart';
import 'iconfont.dart';

import '../lodash/index.dart' as _;
import '../utils/color.dart' show hexToColor;
import './RespositoryListViewShareDataWidget.dart' show RespositoryListViewShareDataWidget;

class RepositoryListView extends StatefulWidget{
  @override
  _RepositoryListViewState createState() => _RepositoryListViewState();

  const RepositoryListView({
      Key key
  }): super(key: key);
}

class _RepositoryListViewState extends State<RepositoryListView> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<Object> repositories = RespositoryListViewShareDataWidget.of(context).data;
    return ListView.builder(
        itemCount: repositories.length,
        itemBuilder: (context, index) {
          final repository = Map.from(repositories[index]);
          final languages = List.castFrom(repository['languages']['nodes']);
          Map language = languages.isEmpty? {}: languages.first;
          List mentionableUsers = _.get(repository, 'mentionableUsers.nodes', []);
          return new Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.1, color: Colors.black54),
              ),
            ),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                      width: 30.0,
                      height: 30.0,
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
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
                              SizedBox(
                                width: 140,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Icon(IconData(0xe3a6, fontFamily: 'MaterialIcons'), color: hexToColor(language != null ? language['color']: ""), size: 12),
                                    ),
                                    Text(language['name'] != null? language['name']: "-/-")
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Icon(IconData(0xe885, fontFamily: 'MaterialIcons'), color: Colors.black, size: 12),
                                    ),
                                    Text(repository['stargazers']['totalCount'].toString())
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Icon(IconFont.fork, color: Colors.black, size: 12),
                                    ),
                                    Text(repository['forkCount'].toString())
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Icon(IconData(58835, fontFamily: 'MaterialIcons'), color: Colors.black45, size: 16),
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
        });
  }

}