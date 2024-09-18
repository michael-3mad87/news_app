import 'package:flutter/material.dart';
import 'package:news_app/news/data/data_source/news_api_data_sources.dart';
import 'package:news_app/news/data/data_source/news_data_sources.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/data/repository/news_repository.dart';
import 'package:news_app/sources/services_locator.dart';

class NewsViewModel with ChangeNotifier {
  NewsRepository newsRepository;
  NewsViewModel()
      : newsRepository = NewsRepository(ServicesLocator.newsDataSources);
  List<News> newsList = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String sourceId) async {
    _setLoading(true);
    try {
      newsList = await newsRepository.getNews(sourceId);
    } on Exception catch (e) {
      errorMessage = e.toString();
    }
    _setLoading(false);
  }

  Future<void> searchNews(String query) async {
    NewsAPIDataSources? newsAPIDataSources;
    _setLoading(true);
    try {
      final response = await newsAPIDataSources!.searchNews(query);
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
