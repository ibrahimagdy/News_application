import 'package:flutter/material.dart';
import 'package:news_application/pages/home_screen/widgets/tab_bar_items.dart';

import '../../../models/source_model.dart';
import 'news_articles_list.dart';

class NewsDetails extends StatefulWidget {
  SourceModel sourceModel;

  NewsDetails({
    super.key,
    required this.sourceModel,
  });

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceModel.sources.length,
        child: Column(
          children: [
            TabBar(
              labelPadding: const EdgeInsets.symmetric(horizontal: 4),
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide.none,
                ),
              ),
              isScrollable: true,
              onTap: (int index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: widget.sourceModel.sources
                  .map((e) => TabBarItem(
                        title: e.name,
                        selected: selectedIndex ==
                            widget.sourceModel.sources.indexOf(e),
                      ))
                  .toList(),
            ),
            Expanded(
                child: NewsArticlesList(
                    source: widget.sourceModel.sources[selectedIndex])),
          ],
        ));
  }
}
