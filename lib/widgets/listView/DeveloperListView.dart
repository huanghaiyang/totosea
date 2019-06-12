import 'package:flutter/material.dart';
import 'package:todash/todash.dart' as _;
import 'package:totosea/widgets/share/DeveloperListViewShareDataWidget.dart'
    show DeveloperListViewShareDataWidget;

class DeveloperListView extends StatefulWidget{
  @override
  _DeveloperListViewState createState() => _DeveloperListViewState();

  const DeveloperListView({
    Key key
  }): super(key: key);
}

class _DeveloperListViewState extends State<DeveloperListView> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<Object> developers = DeveloperListViewShareDataWidget.of(context).data;
    return ListView.builder(
        itemCount: developers.length,
        itemBuilder: (context, index) {
          final developer = Map.from(_.get(developers, '[${index}]', new Map()));
          return developer.isEmpty? new Container(): new Container(
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
                  flex: 1,
                  child: Container(
                      width: 30.0,
                      height: 30.0,
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              developer['avatarUrl']
                          ),
                        ),
                      )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            children: <Widget>[
                              Text(developer['login'], style: TextStyle(
                                  color: Colors.blueAccent
                              ),),
                              Text('('),
                              Text(_.get(developer, 'name', _.get(developer, 'login', '')), style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,

                              )),
                              Text(')')
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Icon(IconData(59493, fontFamily: 'MaterialIcons'), size: 14, color: Colors.teal),
                              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            ),
                            Expanded(
                              child: Text(_.get(developer, 'repositories.nodes.[0].name', '')),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Text(_.get(developer, 'repositories.nodes.[0].description', ''), style: TextStyle(fontSize: 12)),
                                padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  flex: 8,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('follow'),
                  ),
                  flex: 2,
                )
              ],
            ),
          );
        });
  }

}