import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/articles_model.dart';
import '../../models/source_model.dart';
import '../constants.dart';

class ApiManager {
  static Future<SourceModel> fetchSources(String categoryId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": Constants.apiKey,
      "category": categoryId,
    };

    Uri uri = Uri.https(
      Constants.baseURL,
      "/v2/top-headlines/sources",
      queryParameters,
    );

    var response = await http.get(uri);

    SourceModel sourceModel = SourceModel.fromJson(jsonDecode(response.body));

    return sourceModel;
  }

  static Future<ArticlesModel> fetchArticles(String sourceId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": Constants.apiKey,
      "sources": sourceId,
    };

    Uri uri = Uri.https(
      Constants.baseURL,
      "/v2/top-headlines",
      queryParameters,
    );

    var response = await http.get(uri);

    ArticlesModel articlesModel =
        ArticlesModel.fromJson(jsonDecode(response.body));

    return articlesModel;
  }
}
