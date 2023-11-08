import 'package:flutter/material.dart';

import '../../../core/network_layer/api_manger.dart';
import '../../../models/source_model.dart';
import '../home_screen.dart';
import 'news_details_screen.dart';

class NewsView extends StatefulWidget {
  final CategoryData categoryData;

  const NewsView({
    super.key,
    required this.categoryData,
  });

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceModel>(
      future: ApiManager.fetchSources(widget.categoryData.categoryId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        SourceModel sourceModel = snapshot.data!;
        return NewsDetails(
          sourceModel: sourceModel,
        );
      },
    );
  }
}
