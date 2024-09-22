import 'package:flutter/material.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/news_search/data_source/search_data_source.dart';
import 'package:news_app/shared/services_locator.dart';

class SearchViewModel with ChangeNotifier {
  SearchAPIDataSources searchAPIDataSources;

  SearchViewModel()
      : searchAPIDataSources = ServicesLocator.searchAPIDataSources;

  List<News> searchResults = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> searchNews(String query) async {
    _setLoading(true);
    try {
      final response = await searchAPIDataSources.searchNews(query);
      if (response.status == 'ok' && response.articles != null) {
        searchResults = response.articles!;
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
