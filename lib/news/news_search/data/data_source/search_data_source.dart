import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/data/models/news_response.dart';
import 'package:news_app/shared/api_constant.dart';

class SearchAPIDataSources {
  Future<List<News>> searchNews(String query) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.newsEndpoint,
        {'apiKey': APIConstant.apiKey, 'q': query});
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsSearchResponse = NewsResponse.fromJson(json);
    if (newsSearchResponse.status == 'ok' &&
        newsSearchResponse.articles != null) {
      return newsSearchResponse.articles ?? [];
    } else {
      throw Exception('Failed to fetch search results');
    }
  }
}
