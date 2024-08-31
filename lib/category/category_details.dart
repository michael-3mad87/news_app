import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/tabs/source_tap.dart';
import 'package:news_app/widgets/error_state.dart';
import 'package:news_app/widgets/loading_state.dart';

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
  final sources = List.generate(10, (index) => 'source$index');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: APIservices.getSources(widget.categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingState();
          } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
            return ErrorState();
          } else {
            final sources = snapshot.data?.sources ?? [];
            return SourceTap(sources);
          }
        });
  }
}
