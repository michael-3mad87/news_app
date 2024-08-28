import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/tabs/tab_item.dart';

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
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            onTap: (index) => setState(() {
              selectedIndex = index;
            }),
            tabs: sources
                .map((source) => TabItem(
                      isSelected: sources.indexOf(source) == selectedIndex,
                      source: source,
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return NewsItem() ;
            },
          ),
        ),
      ],
    );
  }
}
