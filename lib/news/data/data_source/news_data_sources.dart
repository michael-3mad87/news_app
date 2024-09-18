import 'package:news_app/news/data/models/news.dart';

abstract class NewsDataSources {
  Future<List<News>> getNews(String sourceId);
}
