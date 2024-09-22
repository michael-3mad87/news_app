// import 'package:flutter/material.dart';
// import 'package:news_app/news/data/models/news.dart';
// import 'package:news_app/news/data/repository/news_repository.dart';
// import 'package:news_app/shared/services_locator.dart';

// class NewsViewModel with ChangeNotifier {
//   NewsRepository newsRepository;
//   NewsViewModel()
//       : newsRepository = NewsRepository(ServicesLocator.newsDataSources);
//   List<News> newsList = [];
//   bool isLoading = false;
//   String? errorMessage;
//   Future<void> getNews(String sourceId) async {
//     _setLoading(true);
//     try {
//       newsList = await newsRepository.getNews(sourceId);
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
