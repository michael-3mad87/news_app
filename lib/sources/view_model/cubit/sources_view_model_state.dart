part of 'sources_view_model_cubit.dart';

@immutable
abstract class SourcesState {}

final class SourcesInitial extends SourcesState {}

final class SourcesLoading extends SourcesState {}

final class SourcesSuccess extends SourcesState {
  final List<Source> sources;
  SourcesSuccess(this.sources);
}

final class SourcesError extends SourcesState {
 final String errorMessage;
  SourcesError(this.errorMessage);
}
