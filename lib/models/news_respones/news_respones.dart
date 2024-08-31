import 'news.dart';

class NewsRespones {
  final String? status;
  final int? totalResults;
  final List<News>? articles;

  const NewsRespones({this.status, this.totalResults, this.articles});

  factory NewsRespones.fromJson(Map<String, dynamic> json) => NewsRespones(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => News.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
