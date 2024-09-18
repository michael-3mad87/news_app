import 'package:news_app/news/data/models/source.dart';
import 'package:news_app/sources/data/data_source/sources_data_source.dart';
import 'package:news_app/sources/data/models/source.dart';

class SourcesFirebaseDataSource extends SourcesDataSource {
  @override
  Future<List<Source>> getSources(String categoryId) async {
    //firebase logic
    return [];
  }
}
