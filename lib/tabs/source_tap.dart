import 'package:flutter/material.dart';
import 'package:news_app/models/sources_respones/source.dart';
import 'package:news_app/news/news_list.dart';
import 'package:news_app/tabs/tab_item.dart';

class SourceTap extends StatefulWidget {
  const SourceTap(this.sources, {super.key});
  final List<Source> sources;
  @override
  State<SourceTap> createState() => _SourceTapState();
}

class _SourceTapState extends State<SourceTap> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            onTap: (index) => setState(() {
              selectedIndex = index;
            }),
            tabs: widget.sources
                .map((source) => TabItem(
                      isSelected:
                          widget.sources.indexOf(source) == selectedIndex,
                      source: source.name ?? '',
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: NewsList(widget.sources[selectedIndex].id??'')
        ),
      ],
    );
  }
}
