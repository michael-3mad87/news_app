import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/sources/view/widgets/source_tap.dart';
import 'package:news_app/shared/error_state.dart';
import 'package:news_app/shared/loading_state.dart';
import 'package:news_app/sources/view_model/cubit/sources_view_model_cubit.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(
    this.categoryId, {
    super.key,
  });
  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final sourcesViewModel = SourcesCubit();
  @override
  void initState() {
    super.initState();
    sourcesViewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sourcesViewModel,
      child: BlocBuilder<SourcesCubit, SourcesState>(
        builder: (context, state) {
          if (state is SourcesLoading) {
            return const LoadingState();
          } else if (state is SourcesError) {
            return const ErrorState();
          } else if (state is SourcesSuccess) {
            return SourceTap(state.sources);
          } else {
            return  const SizedBox();
          }
        },
      ),
    );
  }
}
