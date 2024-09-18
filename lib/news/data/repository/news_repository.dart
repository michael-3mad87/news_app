import 'package:news_app/news/data/data_source/news_data_sources.dart';
import 'package:news_app/news/data/models/news.dart';

class NewsRepository {
  NewsDataSources newsDataSources;
  NewsRepository(this.newsDataSources);
  Future<List<News>> getNews(String sourceId) async{
   return newsDataSources.getNews(sourceId);
  }
}
