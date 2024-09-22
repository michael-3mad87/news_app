import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/news_search/data/repository/search_repository.dart';
import 'package:news_app/shared/services_locator.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  late final SearchRepository repository;
  SearchCubit() : super(SearchInitial()) {
    repository = SearchRepository(ServicesLocator.searchAPIDataSources);
  }
  Future<void> searchNews(String query) async {
    emit(SearchLoading());
    try {
      final searchNews = await repository.searchNews(query);
      emit(SearchSuccess(searchNews));
    } on Exception catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
