import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:graphql_flutter/graphql_flutter.dart';

import './graphql_flutter/link.dart' as graphql_flutter;
import './widgets/RepositoryPage.dart' show RepositoryPage;

void main() {
  ValueNotifier<GraphQLClient> client = graphql_flutter.link();
  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {

  const MyApp({ Key key, this.client }) : super(key: key);

  final ValueNotifier<GraphQLClient> client;
  
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: this.client,
      child: CacheProvider(
          child: MaterialApp(
            title: 'Repositories',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(title: 'Repositories'),
          )
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: new RepositoryPage()
      )
    );
  }
}
