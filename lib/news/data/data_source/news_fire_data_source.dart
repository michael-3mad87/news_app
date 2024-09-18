import 'package:news_app/news/data/data_source/news_data_sources.dart';
import 'package:news_app/news/data/models/news.dart';

class NewsFireDataSource extends NewsDataSources {
  @override
  Future<List<News>> getNews(String sourceId) async{
   return [];
  }

}