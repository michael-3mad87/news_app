import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/news_search/data/data_source/search_data_source.dart';

class SearchRepository {
  SearchAPIDataSources searchAPIDataSources;
  SearchRepository(this.searchAPIDataSources);
  Future<List<News>> searchNews(String query) async {
    return searchAPIDataSources.searchNews(query);
  }
}
