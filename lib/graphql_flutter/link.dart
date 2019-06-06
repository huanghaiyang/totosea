import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:totosea/config/github.dart' as githubConfig;

ValueNotifier<GraphQLClient> client;
GraphQLClient graphQLClient;

ValueNotifier<GraphQLClient> link() {
  if(client == null) {
    final HttpLink httpLink = HttpLink(
      uri: githubConfig.ApiV4['host'] + githubConfig.ApiV4['path'],
    );

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer ' + githubConfig.Auth['token'],
    );

    final Link link = authLink.concat(httpLink as Link);

    graphQLClient = GraphQLClient(
      cache: NormalizedInMemoryCache(
        dataIdFromObject: typenameDataIdFromObject,
      ),
      link: link,
    );
    client = ValueNotifier(graphQLClient);
  }
  return client;
}