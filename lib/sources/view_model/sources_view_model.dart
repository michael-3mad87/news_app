import 'package:flutter/material.dart';
import 'package:news_app/sources/data/data_source/sources_data_sources.dart';
import 'package:news_app/sources/data/models/source.dart';

class SourcesViewModel extends ChangeNotifier {
  final dataSource = SourcesDataSources();
  List<Source> sources = [];
  String? errorMessage;
  bool isLoading = false;
  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSource.getSources(categoryId);
      if (response.status == 'ok' && response.sources != null) {
        sources = response.sources!;
      } else {
        errorMessage = 'failed to get sources';
      }
    } on Exception catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
