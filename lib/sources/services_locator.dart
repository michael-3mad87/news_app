import 'package:news_app/news/data/data_source/news_api_data_sources.dart';
import 'package:news_app/news/data/data_source/news_data_sources.dart';
import 'package:news_app/sources/data/data_source/sources_api_data_sources.dart';
import 'package:news_app/sources/data/data_source/sources_data_source.dart';

class ServicesLocator {
  static SourcesDataSource sourcesDataSource = SourcesAPIDataSources();
  static NewsDataSources newsDataSources = NewsAPIDataSources();
}
