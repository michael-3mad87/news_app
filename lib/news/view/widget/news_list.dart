import 'package:flutter/cupertino.dart';
import 'package:news_app/news/view/widget/news_item.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/shared/error_state.dart';
import 'package:news_app/shared/loading_state.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList(this.sourceId, {super.key});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final newsViewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
     newsViewModel.getNews(widget.sourceId);
    return ChangeNotifierProvider(
        create: (_) => newsViewModel,
        child: Consumer<NewsViewModel>(
          builder: (_, newsViewModel, __) {
               if (newsViewModel.isLoading) {
                return const LoadingState();
              } else if (newsViewModel.errorMessage != null) {
                return const ErrorState();
              } else {
                return ListView.builder(
                  itemCount:newsViewModel.newsList.length,
                  itemBuilder: (_, int index) {
                    return NewsItem(newsViewModel.newsList[index]);
                  },
                );
              } 
          },
        )
        );
  }
}
