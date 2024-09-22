import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/data/repository/news_repository.dart';
import 'package:news_app/shared/services_locator.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  late final NewsRepository repository;
  NewsCubit() : super(NewsInitial()) {
    repository = NewsRepository(ServicesLocator.newsDataSources);
  }
  Future<void> getNews(String sourceId) async {
    emit(NewsLoading());
    try {
      final news = await repository.getNews(sourceId);
      emit(NewsSuccess(news));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
