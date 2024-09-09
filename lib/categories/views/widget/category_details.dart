import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:news_app/sources/view/widgets/source_tap.dart';
import 'package:news_app/sources/view_model/sources_view_model.dart';
import 'package:news_app/shared/error_state.dart';
import 'package:news_app/shared/loading_state.dart';
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
  final sourcesViewModel = SourcesViewModel();
  @override
  void initState() {
    super.initState();
    sourcesViewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sourcesViewModel,
      child: Consumer<SourcesViewModel>(
        builder: (_, sourcesViewModel, __) {
          if (sourcesViewModel.isLoading) {
           return const LoadingState();
          } else if (sourcesViewModel.errorMessage != null) {
           return const ErrorState();
          } else {
           return SourceTap(sourcesViewModel.sources);
          }
        },
      ),
    );
  }
}
