import 'package:flutter/material.dart';

import '../../../core/network_layer/api_manger.dart';
import '../../../models/articles_model.dart';
import '../../../models/source_model.dart';
import 'news_article_item.dart';

class NewsArticlesList extends StatelessWidget {
  Source source;

  NewsArticlesList({
    super.key,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesModel>(
      future: ApiManager.fetchArticles(source.id!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Articles> articlesList = snapshot.data?.articles ?? [];
        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) =>
              NewsArticleItem(articles: articlesList[index]),
          itemCount: articlesList.length,
        );
      },
    );
  }
}
