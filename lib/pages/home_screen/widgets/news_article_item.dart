import 'package:flutter/material.dart';

import '../../../models/articles_model.dart';

class NewsArticleItem extends StatelessWidget {
  Articles articles;

  NewsArticleItem({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(articles.urlToImage ?? ""),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          articles.source?.name ?? "",
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF79828B),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          articles.title ?? "",
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF42505C),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
