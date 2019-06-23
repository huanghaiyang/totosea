import 'package:totosea/config/private.dart';

const Auth = const {
  'token': PRIVATE_TOKEN
};

const ApiV4 = const {
  'host': "https://api.github.com",
  'path': "/graphql"
};

const String github = "https://github.com";

const Apis = const {
  'trending': "$github/trending",
  'trending_developers': "$github/trending/developers",
  'topics': '$github/topics'
};