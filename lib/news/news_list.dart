import 'package:flutter/cupertino.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/widgets/error_state.dart';
import 'package:news_app/widgets/loading_state.dart';

class NewsList extends StatelessWidget {
  const NewsList(this.sourceId, {super.key});
  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: APIservices.getNsws(sourceId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingState();
          } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
            return const ErrorState();
          } else {
            final newsList = snapshot.data?.articles??[];
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (_, int index) {
                return NewsItem(newsList[index]);
              },
            );
          }
        });
  }
}
