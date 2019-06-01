import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:graphql_flutter/graphql_flutter.dart';

import '../config/github.dart' as githubConfig;

ValueNotifier<GraphQLClient> link() {
  final HttpLink httpLink = HttpLink(
    uri: githubConfig.ApiV4['host'] + githubConfig.ApiV4['path'],
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ' + githubConfig.Auth['token'],
  );

  final Link link = authLink.concat(httpLink as Link);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: NormalizedInMemoryCache(
        dataIdFromObject: typenameDataIdFromObject,
      ),
      link: link,
    ),
  );
  return client;
}