// import 'package:flutter/material.dart';
// import 'package:news_app/news/data/models/news.dart';

// import 'package:news_app/news/news_search/data/repository/search_repository.dart';
// import 'package:news_app/shared/services_locator.dart';

// class SearchViewModel with ChangeNotifier {
//   SearchRepository repository;

//   SearchViewModel()
//       : repository = SearchRepository(ServicesLocator.searchAPIDataSources);

//   List<News> searchResults = [];
//   bool isLoading = false;
//   String? errorMessage;

//   Future<void> searchNews(String query) async {
//     _setLoading(true);
//     try {
//       searchResults = await repository.searchNews(query);
//     } on Exception catch (e) {
//       errorMessage = e.toString();
//     }
//     _setLoading(false);
//   }

//   void _setLoading(bool value) {
//     isLoading = value;
//     notifyListeners();
//   }
// }
