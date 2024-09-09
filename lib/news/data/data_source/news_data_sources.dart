import 'dart:convert';

import 'package:news_app/shared/api_constant.dart';
import 'package:news_app/news/data/models/news_response.dart';
import 'package:http/http.dart' as http;

class NewsDataSources {
   Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.newsEndpoint, {
      'apiKey': APIConstant.apiKey,
      'sources': sourceId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

   Future<NewsResponse> searchNews(String query) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.newsEndpoint,
        {'apiKey': APIConstant.apiKey, 'q': query});
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}