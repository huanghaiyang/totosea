import 'dart:io';
import 'dart:convert';
import 'dart:core';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:totosea/graphql_flutter/link.dart' show graphQLClient;
import 'package:totosea/config/github.dart' show Apis;
import 'package:totosea/service/query/trendingRepository.dart' show readTrendingRepositories;

import 'package:totosea/store/RepositoryListViewStore.dart' show RepositoryListViewStore;
import 'package:totosea/store/DeveloperListViewStore.dart' show DeveloperListViewStore;

final repositoryListViewStore = RepositoryListViewStore();
final developerListViewStore = DeveloperListViewStore();

Future<Map<String, String>> requestTrendingRepo() async {
  HttpClient client = new HttpClient();
  HttpClientRequest request = await client.getUrl(Uri.parse(Apis['trending']));
  HttpClientResponse response = await request.close();
  String html = await response.transform(utf8.decoder).join();
  Document document = parse(html);
  List<Element> exploreContent = document.getElementsByClassName("explore-content");
  Map<String, String> repoMap = new Map();
  exploreContent.forEach((Element element){
    element.getElementsByClassName("repo-list").forEach((Element repoElement) {
      repoElement.children.forEach((Element repoChildElement) {
        if(repoChildElement.attributes['id'].startsWith(new RegExp("^pa-"))) {
          List<String> names = repoChildElement.getElementsByTagName("a").first.attributes['href'].split(new RegExp("/"));
          if (names.first == "") {
            names.removeAt(0);
          }
          repoMap[names.elementAt(0)] = names.elementAt(1);
        }
      });
    });
  });
  return repoMap;
}

Future<List<QueryResult>> fetchTrendingRepo() async {
  Map<String, String> repoMap = await requestTrendingRepo();
  List<Future<QueryResult>> futureList = new List();
  repoMap.forEach((owner, repoName) async{
    futureList.add(graphQLClient.query(QueryOptions(
      document: readTrendingRepositories, // this is the query string you just created
      variables: {
        'owner': owner,
        'name': repoName,
      },
      pollInterval: 10,
    )));
  });
  return await Future.wait(futureList);
}

Future<List<Map>> transformQueryResult(Future<List<QueryResult>> list, String key) async{
  List<Map> listMap = List();
  List<QueryResult> result = await list;
  result.forEach((QueryResult queryResult) {
    if(!queryResult.hasErrors) {
      listMap.add(queryResult.data[key]);
    }
  });
  return listMap;
}

void fetchIncoming() async {
  Map<String, String> repoMap = await requestTrendingRepo();
  bool hasDataComing = false;
  repoMap.forEach((owner, repoName) async{
    QueryResult queryResult = await graphQLClient.query(QueryOptions(
      document: readTrendingRepositories, // this is the query string you just created
      variables: {
        'owner': owner,
        'name': repoName,
      },
      pollInterval: 10,
    ));
    if(!queryResult.hasErrors) {
      if(!hasDataComing) {
        repositoryListViewStore.clearAll();
        hasDataComing = true;
      }
      repositoryListViewStore.concatOne(queryResult.data['repository']);
    }
  });
}

void fetchIncomingDevelopers() async {

}

