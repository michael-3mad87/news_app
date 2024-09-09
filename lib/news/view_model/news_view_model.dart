import 'package:flutter/material.dart';
import 'package:news_app/news/data/data_source/news_data_sources.dart';
import 'package:news_app/news/data/models/news.dart';

class NewsViewModel with ChangeNotifier {
  final newsDataSources = NewsDataSources();
  List<News> newsList = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getNews(String sourceId) async {
    _setLoading(true);
    try {
      final response = await newsDataSources.getNews(sourceId);
      if (response.status == 'ok' && response.articles != null) {
        newsList = response.articles!;
      } else {
        errorMessage = 'Failed to get news';
      }
    } on Exception catch (e) {
      errorMessage = e.toString();
    }
    _setLoading(false);
  }
  Future<void> searchNews(String query) async {
    _setLoading(true);
    try {
      final response = await newsDataSources.searchNews(query);
      if (response.status == 'ok' && response.articles != null) {
        newsList = response.articles!;
      } else {
        errorMessage = 'No results found';
      }
    } on Exception catch (e) {
      errorMessage = e.toString();
    }
    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
