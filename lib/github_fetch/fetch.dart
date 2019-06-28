import 'dart:core';

import 'package:github_trending/github_trending.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todash/todash.dart' as _;
import 'package:totosea/graphql_flutter/link.dart' show graphQLClient;
import 'package:totosea/service/query/trendingDevelopers.dart'
    show readTrendingDevelopers;
import 'package:totosea/service/query/trendingRepository.dart'
    show readTrendingRepositories;
import 'package:totosea/store/DeveloperListViewStore.dart'
    show DeveloperListViewStore;
import 'package:totosea/store/RepositoryListViewStore.dart'
    show RepositoryListViewStore;
import 'package:totosea/store/TopicsListViewStore.dart'
    show TopicsListViewStore;

final repositoryListViewStore = RepositoryListViewStore();
final developerListViewStore = DeveloperListViewStore();
final topicsListViewStore = TopicsListViewStore();

Future<QueryResult> queryRepository(
    String owner, String name, String graphQl) async {
  return graphQLClient.query(QueryOptions(
    document: graphQl, // this is the query string you just created
    variables: {
      'owner': owner,
      'name': name,
    },
    pollInterval: 10,
  ));
}

// 查询仓库
Future<QueryResult> queryTrendingRepository(String owner, String name) async {
  return queryRepository(owner, name, readTrendingRepositories);
}

// 查询用户
Future<QueryResult> queryTrendingDeveloper(String name) async {
  return graphQLClient.query(QueryOptions(
    document: readTrendingDevelopers,
    // this is the query string you just created
    variables: {
      'name': name,
    },
    pollInterval: 10,
  ));
}

// 一次获取仓库列表
Future<List<QueryResult>> fetchTrendingRepo() async {
  Map<String, String> repoMap = await requestTrendingRepos();
  List<Future<QueryResult>> futureList = new List();
  repoMap.forEach((owner, name) async {
    futureList.add(queryTrendingRepository(owner, name));
  });
  return await Future.wait(futureList);
}

// repo数据转换
Future<List<Map>> transformQueryResult(
    Future<List<QueryResult>> list, String key) async {
  List<Map> listMap = List();
  List<QueryResult> result = await list;
  result.forEach((QueryResult queryResult) {
    if (!queryResult.hasErrors) {
      listMap.add(queryResult.data[key]);
    }
  });
  return listMap;
}

// 异步增强查询
void fetchIncoming() async {
  Map<String, String> repoMap = await requestTrendingRepos();
  bool hasDataComing = false;
  repoMap.forEach((owner, name) async {
    QueryResult queryResult = await queryTrendingRepository(owner, name);
    if (!queryResult.hasErrors) {
      if (!hasDataComing) {
        repositoryListViewStore.clearAll();
        hasDataComing = true;
      }
      repositoryListViewStore.concatOne(queryResult.data['repository']);
    }
  });
}

void fetchIncomingDevelopers() async {
  List<String> names = await requestTrendingDevelopers();
  bool hasDataComing = false;
  names.forEach((name) async {
    QueryResult queryResult = await queryTrendingDeveloper(name);
    if (!queryResult.hasErrors) {
      if (!hasDataComing) {
        developerListViewStore.clearAll();
        hasDataComing = true;
      }
      Object data = _.get(queryResult.data, 'user',
          _.get(queryResult.data, 'organization', new Map()));
      developerListViewStore.concatOne(data);
    }
  });
}

void fetchIncomingTopics() async {
  List<Map<String, String>> list = await requestTopics();
  topicsListViewStore.clearAll();
  topicsListViewStore.concat(list);
}
