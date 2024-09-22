part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<News> searchNews;
  SearchSuccess(this.searchNews);
}

final class SearchError extends SearchState {
  final String errorMessage;
  SearchError(this.errorMessage);
}
