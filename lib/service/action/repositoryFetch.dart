import 'dart:core';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:totosea/graphql_flutter/link.dart' show graphQLClient;
import 'package:totosea/service/query/repositoryDetail.dart' show readRepository;
import 'package:totosea/store/RepositoryDetailCollectionsStore.dart' show RepositoryDetailCollectionsStore;
import 'package:totosea/github_fetch//fetch.dart' show queryRepository;

final repositoryDetailCollectionsStore = RepositoryDetailCollectionsStore();

void fetchRepository(Map params) async {
  QueryResult queryResult = await queryRepository(params['owner'], params['name'], readRepository);
  if(!queryResult.hasErrors) {
    repositoryDetailCollectionsStore.add(params['id'], queryResult.data['repository']);
  }
}