import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/apptheme.dart';
import 'package:news_app/models/news_respones/news.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(this.news, {super.key});
  final News news;
  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Image.network(
              news.urlToImage ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .3,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            news.source?.name ?? '',
            style: titleSmall?.copyWith(
              color: AppTheme.grey,
              fontSize: 10,
            ),
          ),
          Text(
            news.title ?? '',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppTheme.grey2,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(DateTime.now()),
              style: titleSmall?.copyWith(
                color: AppTheme.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
