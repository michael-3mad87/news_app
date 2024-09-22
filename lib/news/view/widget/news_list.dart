import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/view/widget/news_item.dart';
import 'package:news_app/news/view_model/cubit/news_cubit.dart';
import 'package:news_app/shared/error_state.dart';
import 'package:news_app/shared/loading_state.dart';

class NewsList extends StatefulWidget {
  const NewsList(this.sourceId, {super.key});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsCubit>(context).getNews(widget.sourceId);
    return BlocBuilder<NewsCubit,NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const LoadingState();
        } else if (state is NewsError) {
          return const ErrorState();
        } else if (state is NewsSuccess) {
          return ListView.builder(
            itemCount: state.news.length,
            itemBuilder: (_, int index) {
              return NewsItem(state.news[index]);
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
