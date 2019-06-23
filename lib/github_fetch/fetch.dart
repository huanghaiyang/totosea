import 'dart:io';
import 'dart:convert';
import 'dart:core';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:todash/todash.dart' as _;
import 'package:totosea/graphql_flutter/link.dart' show graphQLClient;
import 'package:totosea/config/github.dart' show Apis;
import 'package:totosea/service/query/trendingRepository.dart' show readTrendingRepositories;
import 'package:totosea/service/query/trendingDevelopers.dart' show readTrendingDevelopers;

import 'package:totosea/store/RepositoryListViewStore.dart' show RepositoryListViewStore;
import 'package:totosea/store/DeveloperListViewStore.dart' show DeveloperListViewStore;
import 'package:totosea/store/TopicsListViewStore.dart' show TopicsListViewStore;

final repositoryListViewStore = RepositoryListViewStore();
final developerListViewStore = DeveloperListViewStore();
final topicsListViewStore = TopicsListViewStore();

final linkPattern = new RegExp("^pa-");

Future<Document> requestDocument(String url) async {
  HttpClient client = new HttpClient();
  HttpClientRequest request = await client.getUrl(Uri.parse(url));
  HttpClientResponse response = await request.close();
  String html = await response.transform(utf8.decoder).join();
  Document document = parse(html);
  return document;
}

// 解析trending repos
Future<Map<String, String>> requestTrendingRepo() async {
  Document document = await requestDocument(Apis['trending']);
  List<Element> exploreContent = document.getElementsByClassName("explore-content");
  Map<String, String> repoMap = new Map();
  exploreContent.forEach((Element element){
    element.getElementsByClassName("repo-list").forEach((Element repoElement) {
      repoElement.children.forEach((Element repoChildElement) {
        if(repoChildElement.attributes['id'].startsWith(linkPattern)) {
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

// 解析trending developers
Future<List<String>> requestTrendingDevelopers() async {
  Document document = await requestDocument(Apis['trending_developers']);
  List<Element> exploreContent = document.getElementsByClassName("explore-content");
  List<String> names = new List();
  exploreContent.forEach((Element element){
    element.getElementsByTagName("li").forEach((Element developerElement) {
      if(developerElement.attributes['id'].startsWith(linkPattern)) {
        String href = developerElement.getElementsByTagName("a").first.attributes['href'];
        names.add(href.substring(4, href.length));
      }
    });
  });
  return names;
}

Future<List<Map<String, String>>> requestTopics() async {
  List<Map<String, String>> list = new List();
  Document document = await requestDocument(Apis['topics']);
  document.getElementsByTagName('a').forEach((link) {
    if(link.attributes['href'].startsWith(new RegExp("\\/topics\\/"))) {

      List<Element> nameElements = link.getElementsByClassName('lh-condensed');
      Element nameElement = nameElements.isNotEmpty? nameElements.first: null;
      if(nameElement != null) {
        Map<String, String> map = new Map();
        map['name'] = nameElement.text;
        Element descriptionElement = nameElement.nextElementSibling;
        if(descriptionElement != null) {
          map['description'] = descriptionElement.text;
        }
        List<Element> imageElements = link.getElementsByTagName('img');
        Element imageElement = imageElements.isNotEmpty? imageElements.first: null;
        if(imageElement != null) {
          map['avatarUrl'] = imageElement.attributes['src'];
        }
        list.add(map);
      }
    }
  });
  return list;
}

Future<QueryResult> queryRepository(String owner, String name, String graphQl) async {
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
    document: readTrendingDevelopers, // this is the query string you just created
    variables: {
      'name': name,
    },
    pollInterval: 10,
  ));
}

// 一次获取仓库列表
Future<List<QueryResult>> fetchTrendingRepo() async {
  Map<String, String> repoMap = await requestTrendingRepo();
  List<Future<QueryResult>> futureList = new List();
  repoMap.forEach((owner, name) async{
    futureList.add(queryTrendingRepository(owner, name));
  });
  return await Future.wait(futureList);
}

// repo数据转换
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

// 异步增强查询
void fetchIncoming() async {
  Map<String, String> repoMap = await requestTrendingRepo();
  bool hasDataComing = false;
  repoMap.forEach((owner, name) async{
    QueryResult queryResult = await queryTrendingRepository(owner, name);
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
  List<String> names = await requestTrendingDevelopers();
  bool hasDataComing = false;
  names.forEach((name) async{
    QueryResult queryResult = await queryTrendingDeveloper(name);
    if(!queryResult.hasErrors) {
      if(!hasDataComing) {
        developerListViewStore.clearAll();
        hasDataComing = true;
      }
      Object data = _.get(queryResult.data, 'user', _.get(queryResult.data, 'organization', new Map()));
      developerListViewStore.concatOne(data);
    }
  });
}

void fetchIncomingTopics() async {
  List<Map<String, String>> list = await requestTopics();
  topicsListViewStore.clearAll();
  topicsListViewStore.concat(list);
}
