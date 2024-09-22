import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/shared/services_locator.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/repository/sources_repository.dart';

part 'sources_view_model_state.dart';

class SourcesCubit extends Cubit<SourcesState> {
  late final SourcesRepository repository;
  SourcesCubit() : super(SourcesInitial()) {
    repository = SourcesRepository(ServicesLocator.sourcesDataSource);
  }
  Future<void> getSources(String categoryId) async {
    emit(SourcesLoading());
    try {
      final sources = await repository.getSources(categoryId);
      emit(SourcesSuccess(sources ));
    } catch (e) {
      emit(SourcesError(e.toString()));
    }
  }
}
