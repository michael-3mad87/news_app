import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/models/news_respones/news_respones.dart';
import 'package:news_app/models/sources_respones/sources_respones.dart';

class APIservices {
  static Future<SourcesRespones> getSources(String categoryId) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.sourceEndpoint, {
      'apiKey': APIConstant.apiKey,
      'category': categoryId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesRespones.fromJson(json);
  }

  static Future<NewsRespones> getNsws(String sourceId) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.newsEndpoint, {
      'apiKey': APIConstant.apiKey,
      'sources': sourceId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsRespones.fromJson(json);
  }
}
