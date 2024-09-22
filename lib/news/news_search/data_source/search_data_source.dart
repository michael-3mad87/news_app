import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/news/data/models/news_response.dart';
import 'package:news_app/shared/api_constant.dart';

class SearchAPIDataSources {
  Future<NewsResponse> searchNews(String query) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.newsEndpoint,
        {'apiKey': APIConstant.apiKey, 'q': query});
    final response = await http.get(uri);
    final json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json);
    } else {
      throw Exception('Failed to fetch search results');
    }
  }
}
