// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:news_app/apptheme.dart';
import 'package:news_app/models/news_respones/news.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'newsDetails';
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as News;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
            image: AssetImage(
              "assets/images/pattern.png",
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Image.network(
                  news.urlToImage ??
                      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .3,
                  fit: BoxFit.cover,
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
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .4,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('${news.content}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: AppTheme.navy)),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () async {
                            final url = Uri.parse('${news.url}');
                           if (!await launchUrl(url)) {
                               ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(
                                  content: Text('Could not launch the article'),
                                ),
                              );
                           }
                          },
                          child: Text(
                            'View Full Article',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: AppTheme.navy,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
