// import 'package:flutter/material.dart';
// import 'package:news_app/sources/data/models/source.dart';
// import 'package:news_app/sources/data/repository/sources_repository.dart';
// import 'package:news_app/shared/services_locator.dart';

// class SourcesViewModel extends ChangeNotifier {
//   final SourcesRepository repository;
//   SourcesViewModel()
//       : repository = SourcesRepository(ServicesLocator.sourcesDataSource);
//   List<Source> sources = [];
//   String? errorMessage;
//   bool isLoading = false;
//   Future<void> getSources(String categoryId) async {
//     isLoading = true;
//     notifyListeners();
//     try {
//        sources = await repository.getSources(categoryId);
//     } on Exception catch (e) {
//       errorMessage = e.toString();
//     }
//     isLoading = false;
//     notifyListeners();
//   }
// }
